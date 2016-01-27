<?php

    define('APPLICATION_PATH', dirname(__FILE__));

    require APPLICATION_PATH . '/vendor/autoload.php';

	$application = new \Yaf\Application(APPLICATION_PATH . '/config/application.ini');
	$application->bootstrap()->run();
?>
