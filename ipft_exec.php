<?php
session_start();
include 'conn.php';

 $ipft_id = $_POST['ipft_id'];
 $ipft_year = $_POST['ipft_year'];
 $ipft_period = $_POST['ipft_period'];

    $insertQuery = oci_parse($conn, 'INSERT INTO IPFT (
        IPFT_ID,
        YEAR,
        PERIOD
    ) VALUES (
        :ipft_id,
        :ipft_year,
        :ipft_period
    )');

   

    // Bind form values to bind variables
    oci_bind_by_name($insertQuery, ':ipft_id', $ipft_id);
    oci_bind_by_name($insertQuery, ':ipft_year', $ipft_year);
    oci_bind_by_name($insertQuery, ':ipft_period', $ipft_period);


    $result = oci_execute($insertQuery);
    if (!$result) { 

        echo "Error";
    }else{
        header('Location: soldier_info.php');
            echo "Success";
            }

    
    


?>







