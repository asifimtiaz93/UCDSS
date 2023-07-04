<?php
session_start();
include 'conn.php';

// If the username and password exist, log the user in
 // Assign form values to bind variables
 $soldier_id = $_POST['soldier_id'];
 $name = $_POST['name'];
 $trade = $_POST['trade'];
 $marital_status = $_POST['marital_status'];
 $address = $_POST['address'];
 $blood_group = $_POST['blood_gp'];
 $rank_id = $_POST['rank_id'];
 $age = $_POST['age'];
 $date_of_birth = $_POST['dob'];
 $service_age = $_POST['svc_age'];
 $date_of_joining = $_POST['dt_of_joining'];
 $mobile_number = $_POST['mobile_no'];
 $medical_category = $_POST['med_cat'];
 $promotion_date = $_POST['promotion_dt'];
 $height_inches = $_POST['height'];
 $weight_kg = $_POST['weight'];
 $last_served = $_POST['last_served'];
 $last_opr_marks = $_POST['last_opr_mks'];
 $last_served_appt = $_POST['last_served_appt'];
 $living_status = $_POST['living_status'];
 $gender = $_POST['gender'];


    // Insert the form values into the 'soldiers_basic_info' table
    $insertQuery = oci_parse($conn, 'INSERT INTO SLDRS_BASIC_INFO (
        SLDR_ID,
        Name,
        Trade,
        Marital_Status,
        Address,
        Blood_Group,
        RANK_ID,
        Age,
        DOB,
        SVC_AGE,
        DT_OF_JOINING,
        MOBILE_NO,
        MED_CAT,
        PROMOTION_DT,
        HEIGHT,
        WEIGHT,
        LAST_SERVED_UNIT,
        LAST_SERVED_APPT,
        LAST_OPR_MKS,
        Living_Status,
        SEX
    ) VALUES (
        :soldier_id,
        :name,
        :trade,
        :marital_status,
        :address,
        :blood_group,
        :rank_id,
        :age,
        TO_DATE(:date_of_birth, \'YYYY-MM-DD\'),
        :service_age,
        TO_DATE(:date_of_joining, \'YYYY-MM-DD\'),
        :mobile_number,
        :medical_category,
        TO_DATE(:promotion_date, \'YYYY-MM-DD\'),
        :height_inches,
        :weight_kg,
        :last_served,
        :last_served_appt,
        :last_OPR_marks,
        :living_status,
        :gender
        
    )');

   

    // Bind form values to bind variables
    oci_bind_by_name($insertQuery, ':soldier_id', $soldier_id);
    oci_bind_by_name($insertQuery, ':name', $name);
    oci_bind_by_name($insertQuery, ':trade', $trade);
    oci_bind_by_name($insertQuery, ':marital_status', $marital_status);
    oci_bind_by_name($insertQuery, ':address', $address);
    oci_bind_by_name($insertQuery, ':blood_group', $blood_group);
    oci_bind_by_name($insertQuery, ':rank_id', $rank_id);
    oci_bind_by_name($insertQuery, ':age', $age);
    oci_bind_by_name($insertQuery, ':date_of_birth', $date_of_birth);
    oci_bind_by_name($insertQuery, ':service_age', $service_age);
    oci_bind_by_name($insertQuery, ':date_of_joining', $date_of_joining);
    oci_bind_by_name($insertQuery, ':mobile_number', $mobile_number);
    oci_bind_by_name($insertQuery, ':medical_category', $medical_category);
    oci_bind_by_name($insertQuery, ':promotion_date', $promotion_date);
    oci_bind_by_name($insertQuery, ':height_inches', $height_inches);
    oci_bind_by_name($insertQuery, ':weight_kg', $weight_kg);
    oci_bind_by_name($insertQuery, ':last_served', $last_served);
    oci_bind_by_name($insertQuery, ':last_served_appt', $last_served_appt);
    oci_bind_by_name($insertQuery, ':last_OPR_marks', $last_opr_marks);
    oci_bind_by_name($insertQuery, ':living_status', $living_status);
    oci_bind_by_name($insertQuery, ':gender', $gender);


    $result = oci_execute($insertQuery);
    if (!$result) { 

        echo "Error";
    }else{
       
        echo '<script>alert("Data successfully entered!");</script>';
        header('Location: soldier_info.php');
            }

    
    


?>







