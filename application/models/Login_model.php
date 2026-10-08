<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Login_model extends CI_Model {

	public function getActiveUserByEmail($email)
	{
		return $this->db
			->get_where('employee', array('em_email' => $email, 'status' => 'ACTIVE'), 1)
			->row();
	}

	public function updatePassword($em_id, $hash)
	{
		$this->db->where('em_id', $em_id)->update('employee', array('em_password' => $hash));
	}
}
