<?php
session_start();
include 'conn.php';

 $course_id = $_POST['course_id'];
 $course_name = $_POST['course_name'];
 $lvl = $_POST['lvl'];


    $insertQuery = oci_parse($conn, 'INSERT INTO COURSES (
        COURSE_ID,
        COURSE_NAME,
        LVL
    ) VALUES (
        :course_id,
        :course_name,
        :lvl
        
    )');

   

    // Bind form values to bind variables
    oci_bind_by_name($insertQuery, ':course_id', $course_id);
    oci_bind_by_name($insertQuery, ':course_name', $course_name);
    oci_bind_by_name($insertQuery, ':lvl', $lvl);


    $result = oci_execute($insertQuery);
    if (!$result) { 

        echo "Error";
    }else{
        header('Location: soldier_info.php');
            echo "Success";
            }

    
    


?>







