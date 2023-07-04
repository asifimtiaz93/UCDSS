<?php
include 'conn.php';

// Retrieve the updated values from the form fields
$soldier_id = $_POST['soldier_id'];
$name = $_POST['name'];
$trade = $_POST['trade'];
$marital_status = $_POST['marital_status'];
$address = $_POST['address'];
$blood_group = $_POST['blood_gp'];
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
$last_opr_marks = $_POST['last_opr_marks'];
$living_status = $_POST['living_status'];
$gender = $_POST['gender'];
$rank = $_POST['rank'];
// Retrieve other form field values

// Update the record in the database

$updateQuery = oci_parse($conn, 'UPDATE sldrs_basic_info SET 
    Name = :name,
    Trade = :trade,
    Marital_Status = :marital_status,
    Address = :address,
    Blood_Group = :blood_group,
    Age = :age,
    Date_of_Birth = :date_of_birth,
    Service_Age = :service_age,
    Date_of_Joining = :date_of_joining,
    Mobile_Number = :mobile_number,
    Medical_Category = :medical_category,
    Promotion_Date = :promotion_date,
    Height_Inches = :height_inches,
    Weight_Kg = :weight_kg,
    Last_Served = :last_served,
    Last_OPR_Marks = :last_opr_marks,
    Living_Status = :living_status,
    Gender = :gender,
    Rank = :rank
    WHERE Soldier_Id = :soldier_id');

oci_bind_by_name($updateQuery, ':name', $name);
oci_bind_by_name($updateQuery, ':trade', $trade);
oci_bind_by_name($updateQuery, ':marital_status', $marital_status);
oci_bind_by_name($updateQuery, ':address', $address);
oci_bind_by_name($updateQuery, ':blood_group', $blood_group);
oci_bind_by_name($updateQuery, ':age', $age);
oci_bind_by_name($updateQuery, ':date_of_birth', $date_of_birth);
oci_bind_by_name($updateQuery, ':service_age', $service_age);
oci_bind_by_name($updateQuery, ':date_of_joining', $date_of_joining);
oci_bind_by_name($updateQuery, ':mobile_number', $mobile_number);
oci_bind_by_name($updateQuery, ':medical_category', $medical_category);
oci_bind_by_name($updateQuery, ':promotion_date', $promotion_date);
oci_bind_by_name($updateQuery, ':height_inches', $height_inches);
oci_bind_by_name($updateQuery, ':weight_kg', $weight_kg);
oci_bind_by_name($updateQuery, ':last_served', $last_served);
oci_bind_by_name($updateQuery, ':last_opr_marks', $last_opr_marks);
oci_bind_by_name($updateQuery, ':living_status', $living_status);
oci_bind_by_name($updateQuery, ':gender', $gender);
oci_bind_by_name($updateQuery, ':rank', $rank);
oci_bind_by_name($updateQuery, ':soldier_id', $soldier_id);

oci_execute($updateQuery);

oci_close($conn);

// Redirect back to the previous page or display a success message
header('Location: soldier_info.php');
exit();
?>
