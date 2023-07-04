<?php
include 'conn.php';

// Handle form submission
if ($_SERVER['REQUEST_METHOD'] === 'GET') {
  // Retrieve search query from URL parameters
  if (isset($_GET['search'])) {

  $search = $_GET['search'];
    echo $search;
  // Perform database query based on the search query
  // Connect to the database and execute the query

  // Example code to retrieve data from soldiers_basic_info table
  include 'conn.php';

  $searchQuery = oci_parse($conn, 'SELECT * FROM SLDRS_BASIC_INFO WHERE SLDR_ID = :search');
  oci_bind_by_name($searchQuery, ':search', $search);
  // oci_bind_by_name($searchQuery, ':search', '%' . $search . '%');
  oci_execute($searchQuery);

  $numrows = oci_fetch_all($searchQuery, $res);
    echo $numrows;
  if ($numrows === 0) {
      echo "No data found for the search query.";
      header("Location: soldier_info.php");
  }else{
    oci_execute($searchQuery);
  // Loop through the query results and display the data
  while ($row = oci_fetch_assoc($searchQuery)) {
    // Display the retrieved data as desired
    //echo "Soldier ID: " . $row['SLDR_ID'] . "<br>";
    //echo "Name: " . $row['NAME'] . "<br>";



    $soldier_id = $row['SLDR_ID'];
    $name = $row['NAME'];
    $trade = $row['TRADE'];
    $marital_status = $row['MARITAL_STATUS'];
    $address = $row['ADDRESS'];
    $blood_group = $row['BLOOD_GROUP'];
    $rank = $row['RANK_ID'];
    $age = $row['AGE'];
    $date_of_birth = $row['DOB'];
    $service_age = $row['SVC_AGE'];
    $date_of_joining = $row['DT_OF_JOINING'];
    $mobile_number = $row['MOBILE_NO'];
    $medical_category = $row['MED_CAT'];
    $promotion_date = $row['PROMOTION_DT'];
    $height_inches = $row['HEIGHT'];
    $weight_kg = $row['WEIGHT'];
    $last_served = $row['LAST_SERVED_UNIT'];
    $last_served_appt=$row['LAST_SERVED_APPT'];
    $last_opr_marks = $row['LAST_OPR_MKS'];
    $living_status = $row['LIVING_STATUS'];
    $sex = $row['SEX'];

    // Add more fields to display as needed
  }
  
  }
  }else{
    echo "No data found";
    }
  // Close the database connection

}



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
<style>
  .view {
    background-color: #777;
    padding: 20px;
    border-radius: 5px;
    color: #fff;
}
.view th{
  border: 1px solid #fff;
        padding: 8px;
}
.view td{
  border: 1px solid #fff;
        padding: 8px;
}
.data-item {
    margin-bottom: 10px;
}

.label {
    font-weight: bold;
    width: 150px;
    display: inline-block;
}

.value {
    margin-left: 10px;
}

  </style>
</head>
<body>
<div id="header">
	<div id="menu">
		<ul>
			<li class="active"><a href="index.php">Homepage</a></li>
			<li><a href="#">Blog</a></li>
			<li><a href="#">About</a></li>
			<li><a href="#">Contact</a></li>
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
                    <input type="submit" value="Search"></button>
                </form>
                </div>
                <div>
                  <form action="show_all.php" method="post">
                    <input type="submit" value="Show All">
                  </form>
                </div>
                <div class="view">
    <?php 
    if (isset($_GET['search'])) {
        echo '
        <form action="update_form.php" method="post">
            <input type="hidden" name="soldier_id" value="' . $soldier_id . '">
            <div class="data-item">
                <span class="label">Soldier ID:</span>
                <span class="value">' . $soldier_id . '</span>
            </div>
            <div class="data-item">
                <span class="label">Name:</span>
                <span class="value">' . $name . '</span>
            </div>
            <div class="data-item">
                <span class="label">Trade:</span>
                <span class="value">' . $trade . '</span>
            </div>
            <div class="data-item">
                <span class="label">Rank:</span>
                <span class="value">' . $rank . '</span>
            </div>
            <div class="data-item">
                <span class="label">Service Age:</span>
                <span class="value">' . $service_age . '</span>
            </div>
            <div class="data-item">
                <span class="label">Marital Status:</span>
                <span class="value">' . $marital_status . '</span>
            </div>
            <div class="data-item">
                <span class="label">Address:</span>
                <span class="value">' . $address . '</span>
            </div>
            <div class="data-item">
                <span class="label">Blood Group:</span>
                <span class="value">' . $blood_group . '</span>
            </div>
            <div class="data-item">
                <span class="label">Age:</span>
                <span class="value">' . $age . '</span>
            </div>
            <div class="data-item">
                <span class="label">Date of Birth:</span>
                <span class="value">' . $date_of_birth . '</span>
            </div>
            <div class="data-item">
                <span class="label">Date of Joining:</span>
                <span class="value">' . $date_of_joining . '</span>
            </div>
            <div class="data-item">
                <span class="label">Mobile Number:</span>
                <span class="value">' . $mobile_number . '</span>
            </div>
            <div class="data-item">
                <span class="label">Medical Category:</span>
                <span class="value">' . $medical_category . '</span>
            </div>
            <div class="data-item">
                <span class="label">Promotion Date:</span>
                <span class="value">' . $promotion_date . '</span>
            </div>
            <div class="data-item">
                <span class="label">Height:</span>
                <span class="value">' . $height_inches . '</span>
            </div>
            <div class="data-item">
                <span class="label">Weight:</span>
                <span class="value">' . $weight_kg . '</span>
            </div>
            <div class="data-item">
                <span class="label">Last Served:</span>
                <span class="value">' . $last_served . '</span>
            </div>
            <div class="data-item">
                <span class="label">Last Served Appointment:</span>
                <span class="value">' . $last_served_appt . '</span>
            </div>
            <div class="data-item">
                <span class="label">Last OPR Marks:</span>
                <span class="value">' . $last_opr_marks . '</span>
            </div>
            <div class="data-item">
                <span class="label">Living Status:</span>
                <span class="value">' . $living_status . '</span>
            </div>
            <div class="data-item">
                <span class="label">Gender:</span>
                <span class="value">' . $sex . '</span>
            </div>
            
            <input type="submit" value="Update">
        </form>
        ';
    } else {
        echo "No data found";   
    }
    ?>  
    <?php
    if (isset($_GET['search'])) {
        echo '
        <form action="delete.php" method="post">
            <input type="hidden" name="soldier_id" value="' . $soldier_id . '">
            <input type="submit" name="delete_button" value="Delete" />
        </form>
        ';
    }
    ?>
</div>

			</div>
			<!-- end #content -->
			<?php include('sidebar.php'); ?>
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
