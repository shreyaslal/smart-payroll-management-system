<?php
// Router for PHP's built-in web server (used by tests and quick local runs):
//   php -S 127.0.0.1:8080 tests/router.php
$root = dirname(__DIR__);
$path = parse_url($_SERVER['REQUEST_URI'], PHP_URL_PATH);
if ($path !== '/' && is_file($root . $path)) {
    return false; // serve static assets directly
}
$_SERVER['SCRIPT_NAME'] = '/index.php';
chdir($root);
require $root . '/index.php';
