<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
<!--
Design by TEMPLATED
http://templated.co
Released for free under the Creative Commons Attribution License

Name       : Black Coffee 
Description: A two-column, fixed-width design for 1024x768 screen resolutions.
Version    : 1.0
Released   : 20110707

-->
<?php
include 'conn.php';
?>
<html xmlns="http://www.w3.org/1999/xhtml">

<head>
	<meta http-equiv="content-type" content="text/html; charset=utf-8" />
	<title>UCDSS</title>
	<link rel="shortcut icon" href="favicon.ico">
	<meta name="keywords" content="" />
	<meta name="description" content="" />
	<link href="style.css" rel="stylesheet" type="text/css" media="screen" />
</head>

<body>
	<div id="header">
		<div id="menu">
			<ul>
				<li class="active"><a href="#">Homepage</a></li>
				
				<?php
				session_start();
				if (isset($_SESSION['uname'])) {
					echo '<li style="float: right;"><a href="logout.php">Log out&nbsp;&nbsp;&nbsp;' . $_SESSION['uname'] . '</a></li>';
				} else {
					echo '<li><a href="login.php">Log In</a></li>';
				}
				?>
				
			</ul>
		</div>
		<!-- end #menu -->
		<div id="logo">
			<h1><a href="#">UCDSS</a></h1>
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

						<h2 class="title"><a href="#">Welcome to Unit Commanders Decison Support System </a></h2>
						<div class="entry">
							<p class="welcome-text">Welcome to the Military Unit Commanders Decision Support System! Our system is designed to provide commanders with valuable insights and analysis to aid in making informed decisions. With our integrated Oracle database, we store comprehensive data on soldiers, enabling you to access and query essential information effortlessly.</p>

							<p>Through our user-friendly interface, you'll have the power to run queries and generate reports that will assist you in various decision-making scenarios. Whether you need to analyze soldier demographics, track performance metrics, or evaluate operational readiness, our system empowers you with the tools to extract meaningful intelligence.</p>

							<p>By harnessing the power of data, our Decision Support System enhances your ability to assess and address critical military challenges. We understand the importance of accurate and timely information in making effective decisions, and our system is tailored to streamline your decision-making process.

								With robust features and a secure and reliable Oracle database backend, our system ensures the confidentiality and integrity of your data. Stay ahead of the curve with real-time updates, historical trend analysis, and comprehensive reporting capabilities.</p>

							<p>We are committed to providing commanders with a powerful decision support tool that optimizes military operations and enhances mission success. Join us in harnessing the power of data-driven decision making for your military unit.</p>
						</div>
						<div><a href="#" class="links">View Full Story</a></div>
					</div>

				</div>
				<!-- end #content -->
				<?php include 'sidebar.php'; ?>
				<!-- end #page -->
			</div>
		</div>
		
	</div>
</body>

</html>