<?php
session_start();
include 'conn.php';

 $competition_id = $_POST['competition_id'];
 $competition_name = $_POST['competition_name']; 

    $insertQuery = oci_parse($conn, 'INSERT INTO COMPETITION (
        COMPETITION_ID,
        COMPETITION_NAME
    ) VALUES (
        :competition_id,
        :competition_name
    )');

   

    // Bind form values to bind variables
    oci_bind_by_name($insertQuery, ':competition_id', $competition_id);
    oci_bind_by_name($insertQuery, ':competition_name', $competition_name); 


    $result = oci_execute($insertQuery);
    if (!$result) { 

        echo "Error";
    }else{
        header('Location: soldier_info.php');
            echo "Success";
            }

    
    


?>







