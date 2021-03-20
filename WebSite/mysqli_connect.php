<?php
DEFINE ('DB_HOST', '192.168.43.37');
DEFINE ('DB_USER', 'osman');
DEFINE ('DB_PASSWORD', 'osman123');
DEFINE ('DB_NAME', 'mercury');



/*
DEFINE ('DB_HOST', 'localhost');
DEFINE ('DB_USER', 'root');
DEFINE ('DB_PASSWORD', 'mysql123');
DEFINE ('DB_NAME', 'mercury');

*/


$dbc = @mysqli_connect(DB_HOST,DB_USER,DB_PASSWORD,DB_NAME) OR 
die('Could not connect to MYSQL ' . mysqli_connect_error());


?>
