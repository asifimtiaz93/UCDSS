<?php
session_start();
include 'conn.php';

 $course_id = $_POST['course_id'];
 $soldier_id = $_POST['soldier_id'];
 $date_of_completion = $_POST['date_of_completion'];


    $insertQuery = oci_parse($conn, 'INSERT INTO COMPLETES_COURSE (
        SOLDIER_ID,
        COURSE_ID,
        DATE_OF_COMPLETION
    ) VALUES (
        :soldier_id,
        :course_id,
        TO_DATE(:date_of_completion, \'YYYY-MM-DD\')
        
    )');

   

    // Bind form values to bind variables
    oci_bind_by_name($insertQuery, ':soldier_id', $soldier_id);
    oci_bind_by_name($insertQuery, ':course_id', $course_id);

    oci_bind_by_name($insertQuery, ':date_of_completion', $date_of_completion);


    $result = oci_execute($insertQuery);
    if (!$result) { 

        echo "Error";
    }else{
        header('Location: soldier_info.php');
            echo "Success";
            }

    
    


?>







