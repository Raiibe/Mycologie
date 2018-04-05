<?php

return array(
	'default' => 'dev', // Name of the configuration to use

    // development configuration
	'dev' => array(
		'driver' => 'mysql',
		'host' => 'YOUR_HOST',
		'user' => 'YOUR_USER',
		'pass' => 'YOUR_PWD',
		'dbName' => 'YOUR_DB_NAME',
		'port' => 3306,
        'charset' => 'utf8',
        'collation' => 'utf8_unicode_ci',
        'prefix' => ''
	),

    // production configuration
	'prod' => array(
		'driver' => 'mysql',
		'host' => '',
		'user' => '',
		'pass' => '',
		'dbName' => '',
		'port' => 3306,
        'charset' => 'utf8',
        'collation' => 'utf8_unicode_ci',
        'prefix' => ''
	)
);
