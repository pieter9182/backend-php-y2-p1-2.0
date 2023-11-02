<?php

include 'dbdata.php';

function connectToDatabase($databaseServer,$user,$pass, $schema)
{
    $conn = new mysqli($databaseServer,$user,$pass, $schema) ;
    if($conn->connect_error)
    {
       echo "error try again\r\n"; 
    }
    echo "connected to database\r\n";
    return $conn;
}

$conn = connectToDatabase($databaseServer,$user,$pass, $schema);





?>