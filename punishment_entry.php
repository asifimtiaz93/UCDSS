<?php
session_start();
include 'conn.php';

$punishment_id = $_POST['punishment_id'];
$soldier_id = $_POST['soldier_id'];

    $insertQuery = oci_parse($conn, 'INSERT INTO AWARDED (
        SOLDIER_ID,
        PUNISHMENT_ID
    ) VALUES (
        :soldier_id,
        :punishment_id
    )');

   

    // Bind form values to bind variables
    oci_bind_by_name($insertQuery, ':soldier_id', $soldier_id);
    oci_bind_by_name($insertQuery, ':punishment_id', $punishment_id);


    $result = oci_execute($insertQuery);
    if (!$result) {
        echo "Error";
    } else {
        
        header('Location: punishment.php');
    }

    
    


?>







