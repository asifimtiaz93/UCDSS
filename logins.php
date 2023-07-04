<?php
session_start();
include 'conn.php';
$username = $_POST['user'];

$password = $_POST['password'];
$query = oci_parse($conn, 'SELECT * FROM users WHERE USERNAME = :username AND PASSWORD=:password');

oci_bind_by_name($query, ':username', $username);
oci_bind_by_name($query, ':password', $password);


    
oci_execute($query);


// If the username and password exist, log the user in
while ($row = oci_fetch_assoc($query)) {
    
    
    $_SESSION['uname'] = $row['USERNAME'];
    
    header('Location: dashboard.php');
} 
?>