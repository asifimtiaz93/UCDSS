<?php
session_start();
include 'conn.php';

 $competition_id = $_POST['competition_id'];
 $soldier_id = $_POST['soldier_id']; 

    $insertQuery = oci_parse($conn, 'INSERT INTO PARTICIPATES (
        SOLDIER_ID,
        COMPETITION_ID
    ) VALUES (
        :soldier_id,
        :competition_id
    )');

   

    // Bind form values to bind variables
    oci_bind_by_name($insertQuery, ':soldier_id', $soldier_id);
    oci_bind_by_name($insertQuery, ':competition_id', $competition_id);



    $result = oci_execute($insertQuery);
    if (!$result) { 

        echo "Error";
    }else{
        header('Location: soldier_info.php');
            echo "Success";
            }

    
    


?>







