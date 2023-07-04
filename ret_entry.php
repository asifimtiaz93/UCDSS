<?php
session_start();
include 'conn.php';

$ret_id = $_POST['ret_id'];
$soldier_id = $_POST['soldier_id'];
$result=$_POST['result'];

    $insertQuery = oci_parse($conn, 'INSERT INTO UNDERTAKE_RET (
        SOLDIER_ID,
        RET_ID,
        RESULT
    ) VALUES (
        :soldier_id,
        :ret_id,
        :result
    )');

   

    // Bind form values to bind variables
    oci_bind_by_name($insertQuery, ':soldier_id', $soldier_id);
    oci_bind_by_name($insertQuery, ':ret_id', $ret_id);
    oci_bind_by_name($insertQuery, ':result', $result);


    $result = oci_execute($insertQuery);
    if (!$result) {
        echo "Error";
    } else {
        
        header('Location: ret.php');
    }

    
    


?>







