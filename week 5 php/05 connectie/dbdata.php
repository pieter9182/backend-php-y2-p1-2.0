<?php
$envSettings = [];
    if (file_exists(dirname(__FILE__).'/.env')) {     /* dit check of de file bestaat */ 
        $envSettings = parse_ini_file(dirname(__FILE__).'/.env'); /*het stuurt het naar een associative array*/ 
    }


$databaseServer=$envSettings["DB_HOST"];
$user =$envSettings["DB_USER"];
$pass =$envSettings["DB_PASSWORD"];
$schema = $envSettings["DB_SCHEMA_NAME"];

?>