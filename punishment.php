<?php
session_start();
include 'conn.php';


if (isset($_SESSION['uname']) && $_SESSION['uname']=='CO'){

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
				    <h1> Punishment Information </h1> </br>
					<form action="" method="post">
						<table>
							<tr>
							<td><label for="punishment_id">Punishment ID:</label></td>
							<td><input type="text" name="punishment_id" id="punishment_id" required></td>
							</tr>
							<tr>
							<td><label for="punishmet">Punishment:</label></td>
							<td><input type="text" name="punishment" id="punishment" required></td>
							</tr>
							
							<tr>
							<td><label for="incident">Incident :</label></td>
							<td><select name="incident" id="incident" required>
							<option value="">Enter incident type</option>	
							<option value="moral_turpitude">Moral Turpitude</option>
							<option value="theft">Theft</option>
							<option value="violation_of_good_order">Violation of good order</option>
							</select>
							</td>
							</tr>
						</table>
					<input type="submit" value="Submit">
					</form>
					<?php
					$punishment_id = "";
					$punishment = "";
					$incident = "";

					if ($_SERVER['REQUEST_METHOD'] == 'POST') {
						$punishment_id = $_POST['punishment_id'];
						$punishment = $_POST['punishment'];
						$incident = $_POST['incident'];

						$insertQuery = oci_parse($conn, 'INSERT INTO PUNISHMENT (
							PUNISHMENT_ID,
							PUNISHMENT,
							INCIDENT
						) VALUES (
							:punishment_id,
							 :punishment,
							 :incident
						)'); 

						oci_bind_by_name($insertQuery, ':punishment_id', $punishment_id);
						oci_bind_by_name($insertQuery, ':punishment', $punishment);
						oci_bind_by_name($insertQuery, ':incident', $incident);

						$result = oci_execute($insertQuery);
						if ($result) {
								echo "Punishment Information is added";
						}else{
								echo "Error";
						}
					}
					?>
					<h3>Soldier Punishment Entry</h3>
						<form action="punishment_entry.php" method="post">
						<table>
							<tr>
							<td><label for="soldier_id">Soldier ID:</label></td>
							<td><input type="number" name="soldier_id" id="soldier_id" ></td>
							</tr>
							<tr>
								<td><label for="punishment_id">Punishment ID:</label></td>
								<td><input type="number" name="punishment_id" id="punishment_id" value="<?php echo $punishment_id; ?>"></td>
							</tr>
							<tr>
								<td><input type="submit" value="Submit"></td>
							</tr>
						</table>
						</form>
						<!-- link for individual punishment -->
						<div>
								<a href="individual_punishment.php">Individual Punishment</a>
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