<?php
session_start();
include 'conn.php';

$leave_id = $_POST['leave_id'];
$soldier_id = $_POST['soldier_id'];

    $insertQuery = oci_parse($conn, 'INSERT INTO GRANTED_LVE (
        SOLDIER_ID,
        LEAVE_ID
    ) VALUES (
        :soldier_id,
        :leave_id
    )');

   

    // Bind form values to bind variables
    oci_bind_by_name($insertQuery, ':soldier_id', $soldier_id);
    oci_bind_by_name($insertQuery, ':leave_id', $leave_id);


    $result = oci_execute($insertQuery);
    if (!$result) {
        echo "Error";
    } else {
        $_SESSION['leave_granted'] = true;
        header('Location: leave.php');
    }

    
    


?>







