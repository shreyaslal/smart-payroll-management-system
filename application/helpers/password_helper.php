<?php
defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * Password hashing helpers.
 *
 * New passwords are stored with password_hash() (bcrypt by default).
 * Older rows that still hold an unsalted SHA-1 hash are accepted once and
 * transparently re-hashed on the next successful login.
 */

if ( ! function_exists('hash_password'))
{
	function hash_password($plain)
	{
		return password_hash((string) $plain, PASSWORD_DEFAULT);
	}
}

if ( ! function_exists('is_legacy_hash'))
{
	function is_legacy_hash($hash)
	{
		return is_string($hash) && preg_match('/^[a-f0-9]{40}$/i', $hash) === 1;
	}
}

if ( ! function_exists('check_password'))
{
	function check_password($plain, $hash)
	{
		if (is_legacy_hash($hash))
		{
			return hash_equals(strtolower($hash), sha1((string) $plain));
		}
		return password_verify((string) $plain, (string) $hash);
	}
}
