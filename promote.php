<?php
// Check if the promote button is clicked
if (isset($_POST['promote_button'])) {
    // $soldierID = $_POST['promote_button'];

//  // Retrieve the updated values from the form fields
$soldier_id = $_POST['soldier_id'];
$promotion_date = date('Y-m-d'); // Set the promotion date to today's date
echo $promotion_date;
// Update the record in the database
$updateQuery = oci_parse($conn, 'UPDATE sldrs_basic_info SET PROMOTION_DT = :promotion_date WHERE SLDR_ID = :soldier_id');

oci_bind_by_name($updateQuery, ':promotion_date', $promotion_date);
oci_bind_by_name($updateQuery, ':soldier_id', $soldier_id);

oci_execute($updateQuery);
oci_close($conn);

// Redirect back to the previous page or display a success message
header('Location: promote.php');
exit();





}
?>