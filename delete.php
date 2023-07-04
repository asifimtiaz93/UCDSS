<?php
include 'conn.php';

// Retrieve the Soldier ID from URL parameters
$soldier_id = $_POST['soldier_id'];
echo $soldier_id;
$deleteStatement = oci_parse($conn, "DELETE FROM SLDRS_BASIC_INFO WHERE SLDR_ID = :row_id");
 
oci_bind_by_name($deleteStatement, ':row_id', $soldier_id);
if (oci_execute($deleteStatement)) {
    echo "Row deleted successfully.";
} else {
    $error = oci_error($deleteStatement);
    echo "Deletion failed: " . $error['message'];
}

oci_free_statement($deleteStatement);


oci_close($conn);
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

			<li><a href="login.php">Log In</a></li>
            <!-- <li style="float: right;"><a href="logout.php">Log out &nbsp&nbsp&nbsp<?php echo $_SESSION['uname']; ?></a></li>  -->
		</ul>
	</div>
	<!-- end #menu -->
	<div id="logo">
		<h1><a href="#">Welcome</a></h1>
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
                <form action="" method="get" class="search-form">
                    <input type="text" name="search" placeholder="Search By Soldier ID...">
                    <input type="submit"></button>
                </form>
                </div>
                <div class="view">
               


           
                </div>   
			</div>
			<!-- end #content -->
			<?php include 'sidebar.php'; ?>
			<!-- end #sidebar -->
			<div style="clear: both;">&nbsp;</div>
		</div>
		<!-- end #page -->
	</div>
</div>
<div id="footer-bgcontent">
	<div id="footer">
		<p>&copy; Untitled. All rights reserved. Design by <a href="http://templated.co" rel="nofollow">TEMPLATED</a>.</p>
	</div>
	<!-- end #footer -->
</div>
</body>
</html>
