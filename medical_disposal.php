<?php
session_start();
include 'conn.php';


if (isset($_SESSION['uname']) && $_SESSION['uname'] == 'CO') {

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
		<script>
			function copyText() {
				var dateValue = document.getElementById("date_of_adm").value;
    
				// Convert the date to a number
				var dateAsNumber = new Date(dateValue).getTime();
				// Get the value from the source text field
				var sourceText = document.getElementById("soldier_id").value;
				var result = (dateAsNumber % parseInt(sourceText));
				// Set the value to the destination text field
				document.getElementById("disp_id").value = result;
			}
		</script>
	</head>

	<body>
		<div id="header">
			<div id="menu">
				<ul>
					<li class="active"><a href="index.php">Homepage</a></li>
					<li><a href="#">Blog</a></li>
					<li><a href="#">About</a></li>
					<li><a href="#">Contact</a></li>

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
							<h1>Medical Disposal Data Entry </h1> </br>
							<form action="" method="post">
								<table>
									<tr>
										<td><label for="soldier_id">Soldier ID:</label></td>
										<td><input type="number" name="soldier_id" id="soldier_id" required></td>
									</tr>
									<tr>
										<td><label for="date_of_adm">Date of Admission:</label></td>
										<td><input type="date" name="date_of_adm" id="date_of_adm" required></td>
									</tr>
									<tr>
										<td><label for="disp_id">Disposal ID:</label></td>
										<td><input type="number" name="disp_id" id="disp_id" required></td>
										<td><button onclick="copyText()">Generate ID</button></td>
									</tr>
									<tr>
										<td><label for="disposal">Disposal:</label></td>
										<td><select name="disposal" id="disposal" required>
												<option value="">--Select--</option>
												<option value="SIQ">SIQ</option>
												<option value="PPGF">PPGF</option>
												<option value="Medical_lve">Medical Leave</option>
										</td>
									</tr>
									
									<tr>
										<td><label for="total_disp">Total Disposal:</label></td>
										<td><input type="number" name="total_disp" id="total_disp" required></td>
									</tr>
									<tr>
										<td><label for="reason">Reason:</label></td>
										<td><input type="text" name="reason" id="reason" required></td>
									</tr>
									
								</table>
								<input type="submit" value="Submit">
							</form>
							<?php
					$soldier_id  = ""; // Variable to store the value of Soldier_id
					$date_of_adm  = ""; // Variable to store the value of Date of Admission
					$disp_id   = ""; // Variable to store the value of Disp_ID
					$Disposal= ""; // Variable to store the value of Disposal
					$Total_disp= ""; // Variable to store the value of Total_disp = ""; // Variable to store the generated Total Days
					$reason = ""; // Variable to store the generated Reason

					// Check if the form is submitted
					if ($_SERVER["REQUEST_METHOD"] == "POST") {
						// Retrieve the form input values
						
						$soldier_id = $_POST['soldier_id'];
						$date_of_adm = $_POST['date_of_adm'];
						$disp_id = $_POST['disp_id'];
						$Disposal = $_POST['disposal'];
						$Total_disp = $_POST['total_disp'];
						$reason = $_POST['reason'];



						//query to insert leave data
						$insertQuery = oci_parse($conn, 'INSERT INTO MED_DISPOSAL (
							DISP_ID,
							DISPOSAL,
							DATE_OF_ADM,
							TOTAL_DISP,
							REASON,
							SOLDIER_ID
						) VALUES (
							:dispID,
							 :disposal,
							 TO_DATE(:date_of_adm, \'YYYY-MM-DD\'),
							 :total_disp,
							 :reason,
							 :soldier_id
						)'); 

						  // Bind form values to bind variables
						oci_bind_by_name($insertQuery, ':dispID', $disp_id);
						oci_bind_by_name($insertQuery, ':disposal', $Disposal);
						oci_bind_by_name($insertQuery, ':date_of_adm', $date_of_adm);
						oci_bind_by_name($insertQuery, ':total_disp', $Total_disp);
						oci_bind_by_name($insertQuery, ':reason', $reason);
						oci_bind_by_name($insertQuery, ':soldier_id', $soldier_id);
						

						$result = oci_execute($insertQuery);

						if (!$result) { 

							echo "Error";
						}else{
						   
							echo '<script>alert("Data successfully entered!");</script>';
							
								}
					}
					
					?>
						<a href="med_overview.php">Overview </a></br>
						<!-- <a href="med_indl.php">Individual Medical Disposal </a> -->

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

} else {
	header('location:404.php');
}
?>