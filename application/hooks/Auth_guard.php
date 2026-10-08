<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Central authentication + role check, run after every controller is built
 * (post_controller_constructor hook).
 *
 *  - Only the login controller is reachable without a session.
 *  - EMPLOYEE accounts can reach only the self-service pages listed in
 *    $employee_allowed; everything else is ADMIN-only.
 *
 * Controller and method names are compared in lower case.
 */
class Auth_guard {

	private $public_routes = array(
		'login' => array('index', 'login_auth', 'logout'),
	);

	private $employee_allowed = array(
		'dashboard' => array('index', 'dashboard', 'add_todo', 'update_todo'),
		'employee'  => array('view', 'reset_password', 'educationbyib', 'experiencebyib'),
		'leave'     => array('holidays', 'holidays_for_calendar', 'emapplication', 'add_applications',
		                     'leaveappbyid', 'leaveassign', 'getearnebalancebyemcode', 'leavetype'),
		'projects'  => array('index', 'all_projects', 'all_tasks', 'view', 'tasksbyid', 'projectbyid',
		                     'notesbyid', 'expensesbyid', 'logisticbyid', 'add_pro_notes', 'add_file',
		                     'field_application', 'getfieldvisitappdata'),
		'logistice' => array('getinstock', 'getassignforlogistic'),
	);

	public function check()
	{
		$CI =& get_instance();
		$class  = strtolower($CI->router->fetch_class());
		$method = strtolower($CI->router->fetch_method());

		if (isset($this->public_routes[$class]) && in_array($method, $this->public_routes[$class], TRUE))
		{
			return;
		}

		if ($CI->session->userdata('user_login_access') != 1)
		{
			if ($CI->input->is_ajax_request())
			{
				$this->deny(401, 'Session expired. Please log in again.');
			}
			redirect(base_url() . 'login');
		}

		if ($CI->session->userdata('user_type') === 'ADMIN')
		{
			return;
		}

		$allowed = isset($this->employee_allowed[$class]) && in_array($method, $this->employee_allowed[$class], TRUE);
		if ( ! $allowed)
		{
			$this->deny(403, 'You do not have permission to access this page.');
		}

		// Employees may only open their own profile.
		if ($class === 'employee' && $method === 'view')
		{
			$requested = base64_decode((string) $CI->input->get('I'), TRUE);
			if ($requested !== $CI->session->userdata('user_login_id'))
			{
				$this->deny(403, 'You can only view your own profile.');
			}
		}
	}

	private function deny($status, $message)
	{
		set_status_header($status);
		echo $message;
		exit;
	}
}
