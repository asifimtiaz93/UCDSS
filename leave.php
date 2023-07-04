<?php
session_start();
include 'conn.php';


// Check if the leave was granted successfully
if (isset($_SESSION['leave_granted']) && $_SESSION['leave_granted']) {
    echo '<script>alert("Successfully granted leave")</script>';
    unset($_SESSION['leave_granted']); // Clear the session variable
}

if (isset($_SESSION['uname']) ){

    ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="content-type" content="text/html; charset=utf-8" />
<title>UCDSS</title>
<link rel="icon" href="favicon.ico">
<meta name="keywords" content="" />
<meta name="description" content="" />
<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>
<body>
<div id="header">
	<div id="menu">
		<ul>
			<li class="active"><a href="index.php">Homepage</a></li>
			<li class="active"><a href="leave_insight.php">Leave Insight</a></li>

			
            <li style="float: right;"><a href="logout.php">Log out &nbsp&nbsp&nbsp<?php echo $_SESSION['uname']; ?></a></li>
		</ul>
	</div>
	<!-- end #menu -->
	<div id="logo">
		<h1><a href="#">Welcome To Dashboard</a></h1>
		<h2>Unit Commander's Decision Support System</h2>
	</div>
	<hr />
</div>
<!-- end #header -->
<!-- end #header-wrapper -->
<!-- end #logo -->
<div id="page">
	<div id="page-bgtop">
		<div id="page-bgbtm">
			<div id="content">
				<div class="post">
				    <h1> Leave Data Entry </h1> </br>
					</br>
					<div>
						<p><h3> Leave ID Generator </h3></p>
					</div>

                    <form action="" method="post">
						<table>
							<tr>
							<td><label for="from_dt">From Date:</label></td>
							<td><input type="date" name="from_dt" id="from_dt" required></td>
							</tr>
							<tr>
							<td><label for="to_dt">To Date:</label></td>
							<td><input type="date" name="to_dt" id="to_dt" required></td>
							</tr>
							
							<tr>
							<td><label for="leave_type">Leave Type:</label></td>
							<td><select name="leave_type" id="leave_type" required>
							<option value="">Enter leave type</option>	
							<option value="clve">Casual Leave</option>
							<option value="plve">Previlege Leave</option>
							<option value="rlve">Recreation Leave</option>
							</select>
							</td>
							</tr>
						</table>
					<input type="submit" value="Submit">
					</form>
					<?php
					$fromDt = ""; // Variable to store the value of FROM_DT
					$toDt = ""; // Variable to store the value of TO_DT
					$totalLeave = ""; // Variable to store the value of TOTAL_LEAVE
					$leaveType = ""; // Variable to store the value of LEAVE_TYPE
					$leaveID = ""; // Variable to store the generated LEAVE_ID

					// Check if the form is submitted
					if ($_SERVER["REQUEST_METHOD"] == "POST") {
						// Retrieve the form input values
						
						$fromDt = $_POST['from_dt'];
						$toDt = $_POST['to_dt'];
						
						$leaveType = $_POST['leave_type'];
						
						$datetime1 = new DateTime($fromDt);
						$datetime2 = new DateTime($toDt);
						$interval = $datetime1->diff($datetime2);

						$totalLeave = $interval->format('%a') + 1;
						

						// Convert FROM_DT and TO_DT to numeric value
						$fromDtNumeric = intval(str_replace("/", "", $fromDt));
						$toDtNumeric = intval(str_replace("/", "", $toDt));

						// Add day, month, year, and TOTAL_LEAVE
						$numericValue = $fromDtNumeric + $toDtNumeric + $totalLeave;

						// Add ASCII value of LEAVE_TYPE
						$asciiValue = 0;
						for ($i = 0; $i < strlen($leaveType); $i++) {
							$asciiValue += ord($leaveType[$i]);
						}

						// Add ASCII value to the numeric value
						$leaveID = $numericValue + $asciiValue;

						if (!empty($leaveID)) {
							echo "Generated Leave ID: " . $leaveID;
						}
						
						echo '</br>';

						//query to insert leave data
						$insertQuery = oci_parse($conn, 'INSERT INTO LEAVE_REGISTER (
							LEAVE_ID,
							FROM_DT,
							TO_DT,
							TOTAL_LEAVE,
							LEAVE_TYPE
						) VALUES (
							:leaveID,
							TO_DATE(:fromDt, \'YYYY-MM-DD\'),
							TO_DATE(:toDt, \'YYYY-MM-DD\'),
							:totalLeave,
							:leaveType
						)'); 

						  // Bind form values to bind variables
						oci_bind_by_name($insertQuery, ':leaveID', $leaveID);	
						oci_bind_by_name($insertQuery, ':fromDt', $fromDt);
						oci_bind_by_name($insertQuery, ':toDt', $toDt);
						oci_bind_by_name($insertQuery, ':totalLeave', $totalLeave);
						oci_bind_by_name($insertQuery, ':leaveType', $leaveType);

						try {
						$result = @oci_execute($insertQuery);
						$error_message = ""; // Variable to store the error message

						
							// ... Your code for executing the insert queries ...
						
							if (!$result) {
								throw new Exception("Error inserting data.");
							} else {
								// Success message if needed
								$success_message = "";
							}
						} catch (Exception $e) {
							// Log the error or perform any necessary actions
							// Store the error message
							$error_message = "";
						}
						
						// Display the error message on the page if it exists
						if (!empty($error_message)) {
							echo $error_message;
						}
						
						
						
						

						
					}
					
					?>

					
						<h3>Soldier Leave Entry</h3>
						<form action="leave_grant.php" method="post">
						<table>
							<tr>
							<td><label for="soldier_id">Soldier ID:</label></td>
							<td><input type="number" name="soldier_id" id="soldier_id" ></td>
							</tr>
							<tr>
								<td><label for="leave_id">Leave ID:</label></td>
								<td><input type = "number" name = "leave_id" id = "leave_id" value = "<?php echo $leaveID; ?>" readonly></td>
							</tr>
							<tr>
								<td><input type="submit" value="Submit"></td>
							</tr>
						</table>
						</form>

				</div>
				
                    </div>
                </div>
			</div>
			<?php include 'sidebar.php'; ?>
			<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end #page -->
	</div>
</div>
<div id="footer-bgcontent">
	<div id="footer">
		<p>&copy; Group6. All rights reserved. Design by <a href="http://gp6.com" rel="nofollow">Group 06</a>.</p>
	</div>
	<!-- end #footer -->
</div>
</body>
</html>
<?php

}else{
    header('location:404.php');
}
?>