<?php
session_start();
include 'conn.php';


// Check if the leave was granted successfully
// if (isset($_SESSION['leave_granted']) && $_SESSION['leave_granted']) {
//     echo '<script>alert("Successfully granted leave")</script>';
//     unset($_SESSION['leave_granted']); // Clear the session variable
// }

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
			<li class="active"><a href="ret_insight.php">RET Insight</a></li>

			
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
				    <h1> RET Data Entry </h1> </br>
					</br>

                    <form action="" method="post">
						<table>
							<tr>
							<td><label for="ret_id">RET ID:</label></td>
							<td><input type="number" name="ret_id" id="ret_id" required></td>
							</tr>
							<tr>
							<td><label for="ret_year">RET Year:</label></td>
							<td><input type="number" name="ret_year" id="ret_year" required></td>
							</tr>
						</table>
					<input type="submit" value="Submit">
					</form>
					<?php
					

					// Check if the form is submitted
					if ($_SERVER["REQUEST_METHOD"] == "POST") {
						// Retrieve the form input values
						
						$ret_id = $_POST['ret_id'];
						$ret_year = $_POST['ret_year'];
						
						
						//query to insert leave data
						$insertQuery = oci_parse($conn, 'INSERT INTO RET (
							RET_ID,
							YEAR
						) VALUES (
							:ret_id,
							 :ret_year
						)'); 

						  // Bind form values to bind variables
						oci_bind_by_name($insertQuery, ':ret_id', $ret_id);
						oci_bind_by_name($insertQuery, ':ret_year', $ret_year);

						$result = oci_execute($insertQuery);
						
					}
					
					?>

					
						<h3>Soldier RET Entry</h3>
						<form action="ret_entry.php" method="post">
						<table>
							<tr>
							<td><label for="soldier_id">Soldier ID:</label></td>
							<td><input type="number" name="soldier_id" id="soldier_id" ></td>
							</tr>
							<tr>
								<td><label for="ret_id">RET ID:</label></td>
								<td><input type = "number" name = "ret_id" id = "ret_id" value="<?php echo $ret_id; ?>"></td>
							</tr>
							<td><label for="result">Result:</label></td>
							<td><select name="result" id="result">
									<option value="Passed">Passed</option>
									 <option value="Failed">Failed</option>
									 </select>
									 </td>
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