<?php
session_start();
include 'conn.php';


if (isset($_SESSION['uname']) && $_SESSION['uname']=='admin'){

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
				    <h1> Marital Status Information </h1> </br>
                    <div class="search-container">
                        <input type="text" placeholder="Search by Soldier Name">
                        <input type="text" placeholder="Search by Service age">
                        <select>
                            <option value="">Select Status</option>
                            <option value="married">Married</option>
                            <option value="Unmarried">Unmarried</option>
                            <option value="Divorced">Divorced</option>
                            <!-- Add more rank options as needed -->
                        </select>
                        <input type="submit" value="Search">
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