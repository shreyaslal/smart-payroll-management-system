"""Smoke test: logs in as admin and employee, opens every main page and
checks for PHP errors, then verifies the access-control rules.

Usage:  BASE_URL=http://127.0.0.1:8080/ python tests/smoke.py
"""
import os, re, sys
import requests

B = os.environ.get('BASE_URL', 'http://127.0.0.1:8080/')
ADMIN=['dashboard/Dashboard','organization/Department','organization/Designation','employee/Employees','employee/Disciplinary','employee/Inactive_Employee','employee/Add_employee','attendance/Attendance','attendance/Save_Attendance','attendance/Attendance_Report','leave/Holidays','leave/leavetypes','leave/Application','leave/Earnedleave','leave/Leave_report','Projects/All_Projects','Projects/All_Tasks','Projects/Field_visit','Loan/View','Loan/installment','Logistice/Assets_Category','Logistice/All_Assets','Logistice/logistic_support','Payroll/Salary_List','Payroll/Generate_salary','Payroll/Payslip_Report','notice/All_notice','settings/Settings','employee/view?I=QWthMTc1Mw==','Projects/view?P=Ng==']
EMP=['dashboard/Dashboard','employee/view?I=a3VtMTk2Mw==','leave/Holidays','leave/EmApplication','Projects/All_Projects','Projects/All_Tasks']
def login(email,pw):
    s=requests.Session(); s.get(B)
    r=s.post(B+'login/Login_Auth',data={'email':email,'password':pw},allow_redirects=True)
    ok = 'login/logout' in s.get(B+'dashboard/Dashboard').text
    return s,ok
def check(s,urls,label):
    bad=0
    for u in urls:
        r=s.get(B+u,allow_redirects=False)
        errs=set(re.findall(r'Message:\s*(.*?)</p>',r.text))
        errs|=set(re.findall(r'<h1>(A Database Error Occurred|404 Page Not Found|An uncaught Exception)',r.text))
        flag='OK ' if r.status_code==200 and not errs and 'login/logout' in r.text else 'BAD'
        if flag=='BAD': bad+=1
        print(f'{label} {flag} {r.status_code} {u} {"; ".join(list(errs)[:3])[:300]}')
    return bad
a,a_ok=login('admin@impactsolutions.com','admin123456'); print('admin login ok:',a_ok)
e,e_ok=login('vinoth@impactsolutions.com','Vinoth@123'); print('emp login ok:',e_ok)
bad=check(a,ADMIN,'ADMIN')+check(e,EMP,'EMP')
if not (a_ok and e_ok):
    print('login failed'); sys.exit(1)

# Access control: anonymous users go to login, employees cannot open admin pages.
for u in ['employee/Employees', 'payroll/Salary_List', 'dashboard/Dashboard']:
    r = requests.get(B + u, allow_redirects=False)
    ok = r.status_code in (302, 303, 307) and 'login' in r.headers.get('Location', '')
    print(f"ANON {'OK ' if ok else 'BAD'} {r.status_code} {u}"); bad += not ok
for u in ['payroll/Salary_List', 'settings/Settings', 'employee/Employees',
          'organization/Department', 'employee/view?I=QWthMTc1Mw==']:
    r = e.get(B + u, allow_redirects=False)
    ok = r.status_code == 403
    print(f"EMP-DENY {'OK ' if ok else 'BAD'} {r.status_code} {u}"); bad += not ok

print('FAILED' if bad else 'ALL PASSED')
sys.exit(1 if bad else 0)
