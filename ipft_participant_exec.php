<?php
session_start();
include 'conn.php';

 $soldier_id = $_POST['soldier_id'];
 $ipft_id = $_POST['ipft_id'];
 $result = $_POST['ipft_result'];


    $insertQuery = oci_parse($conn, 'INSERT INTO UNDERTAKES (
        SOLDIER_ID,
        IPFT_ID,
        RESULT
    ) VALUES (
        :soldier_id,
        :ipft_id,
        :result
    )');

   

    // Bind form values to bind variables
    
    oci_bind_by_name($insertQuery, ':soldier_id', $soldier_id);
    oci_bind_by_name($insertQuery, ':ipft_id', $ipft_id);
    oci_bind_by_name($insertQuery, ':result', $result);

    $result = oci_execute($insertQuery);
    if (!$result) { 

        echo "Error";
    }else{
        header('Location: soldier_info.php');
            echo "Success";
            }

    
    


?>







