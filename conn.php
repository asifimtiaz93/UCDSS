<?php

$username = 'xe';
$password = 'xe';
$connection_string = 'localhost/xe';

$conn = oci_connect(
    $username,$password,$connection_string
);

if (!$conn)
    echo "failed!";
else
    echo 'connected';


?>