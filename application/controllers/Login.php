<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login extends CI_Controller {

	public function __construct()
	{
		parent::__construct();
		$this->load->model('login_model');
	}

	public function index()
	{
		if ($this->session->userdata('user_login_access') == 1)
		{
			redirect(base_url() . 'dashboard');
		}
		$this->load->view('login');
	}

	public function Login_Auth()
	{
		$this->load->library('form_validation');
		$this->form_validation->set_rules('email', 'User Email', 'trim|required|valid_email');
		$this->form_validation->set_rules('password', 'Password', 'required|min_length[6]');

		if ($this->form_validation->run() === FALSE)
		{
			$this->session->set_flashdata('feedback', 'UserEmail or Password is Invalid!');
			redirect(base_url() . 'login', 'refresh');
		}

		$email    = $this->input->post('email', TRUE);
		$password = $this->input->post('password');

		if ($this->validate_login($email, $password))
		{
			// Only the e-mail is remembered; the password is never stored in a cookie.
			if ($this->input->post('remember'))
			{
				set_cookie('email', $email, 86400 * 30);
			}
			else
			{
				delete_cookie('email');
			}
			redirect(base_url() . 'dashboard', 'refresh');
		}

		$this->session->set_flashdata('feedback', 'UserEmail or Password is Invalid');
		redirect(base_url() . 'login', 'refresh');
	}

	private function validate_login($email, $password)
	{
		$user = $this->login_model->getActiveUserByEmail($email);
		if ( ! $user OR ! check_password($password, $user->em_password))
		{
			return FALSE;
		}

		// Upgrade legacy SHA-1 hashes to password_hash() on first successful login.
		if (is_legacy_hash($user->em_password))
		{
			$this->login_model->updatePassword($user->em_id, hash_password($password));
		}

		$this->session->sess_regenerate(TRUE);
		$this->session->set_userdata(array(
			'user_login_access' => '1',
			'user_login_id'     => $user->em_id,
			'name'              => $user->first_name,
			'email'             => $user->em_email,
			'user_image'        => $user->em_image,
			'user_type'         => $user->em_role,
		));
		return TRUE;
	}

	public function logout()
	{
		$this->session->sess_destroy();
		redirect(base_url(), 'refresh');
	}
}
