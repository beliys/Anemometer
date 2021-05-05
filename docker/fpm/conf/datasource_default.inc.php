<?php
$conf['datasources']['default'] = array(
	'host'	=> getenv('ANEMOMETER_MYSQL_HOST') ?: 'localhost',
	'port'	=> getenv('ANEMOMETER_MYSQL_PORT') ?: 3306,
	'db'	=> getenv('ANEMOMETER_MYSQL_DB') ?: 'slow_query_log',
	'user'	=> getenv('ANEMOMETER_MYSQL_USER') ?: 'root',
	'password' => getenv('ANEMOMETER_MYSQL_PASS') ?: '',
	'tables' => array(
		'global_query_review' => 'fact',
		'global_query_review_history' => 'dimension'
	),
	'source_type' => 'slow_query_log'
);
