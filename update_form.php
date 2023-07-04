<?php
include 'conn.php';

// Retrieve the Soldier ID from URL parameters
$soldier_id = $_POST['soldier_id'];
//echo $soldier_id;
// Retrieve the existing record from the database
$selectQuery = oci_parse($conn, 'SELECT * FROM sldrs_basic_info WHERE SLDR_ID = :soldier_id');
oci_bind_by_name($selectQuery, ':soldier_id', $soldier_id);
oci_execute($selectQuery);

while ($row = oci_fetch_assoc($selectQuery)) {
    // Display the retrieved data as desired
    //echo "Soldier ID: " . $row['SLDR_ID'] . "<br>";
   //echo "Name: " . $row['NAME'] . "<br>";

    $soldier_id = $row['SLDR_ID'];
    //echo $soldier_id;
    
    
    $name = $row['NAME'];
    $trade = $row['TRADE'];
    $marital_status = $row['MARITAL_STATUS'];
    $address = $row['ADDRESS'];
    $blood_group = $row['BLOOD_GROUP'];
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
    $last_opr_marks = $row['LAST_OPR_MKS'];
    $living_status = $row['LIVING_STATUS'];
    $gender = $row['SEX'];
    $rank = $row['RANK_ID'];
    // Add more fields to display as needed
  }

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
                    <input type="submit"></button>
                </form>
                </div>
                <div class="view">
                <form action="update_record.php" method="post">
              
                <table>
    <tr>
        <td>Soldier ID</td>
        <td><input type="text" name="soldier_id" id="soldier_id" value="<?php echo $soldier_id; ?>"></td>
    </tr>
    <tr>
        <td>Name</td>
        <td><input type="text" name="name" id="name" value="<?php echo $name; ?>"></td>
    </tr>
    <tr>
        <td>Trade</td>
        <td><input type="text" name="trade" id="trade" value="<?php echo $trade; ?>"></td>
    </tr>
    <tr>
        <td>Marital Status</td>
        <td><input type="text" name="marital_status" id="marital_status" value="<?php echo $marital_status; ?>"></td>
    </tr>
    <tr>
        <td>Address</td>
        <td><input type="text" name="address" id="address" value="<?php echo $address; ?>"></td>
    </tr>
    <tr>
        <td>Blood Group</td>
        <td><input type="text" name="blood_gp" id="blood_gp" value="<?php echo $blood_group; ?>"></td>
    </tr>
    <tr>
        <td>Age</td>
        <td><input type="number" name="age" id="age" value="<?php echo $age; ?>"></td>
    </tr>
    <tr>
        <td>Date of Birth</td>
        <td><input type="date" name="dob" id="dob" value="<?php echo $date_of_birth; ?>"></td>
    </tr>
    <tr>
        <td>Service Age</td>
        <td><input type="number" name="svc_age" id="svc_age" value="<?php echo $service_age; ?>"></td>
    </tr>
    <tr>
        <td>Date of Joining</td>
        <td><input type="date" name="dt_of_joining" id="dt_of_joining" value="<?php echo $date_of_joining; ?>"></td>
    </tr>
    <tr>
        <td>Mobile Number</td>
        <td><input type="text" name="mobile_no" id="mobile_no" value="<?php echo $mobile_number; ?>"></td>
    </tr>
    <tr>
        <td>Medical Category</td>
        <td><input type="text" name="med_cat" id="med_cat" value="<?php echo $medical_category; ?>"></td>
    </tr>
    <tr>
        <td>Promotion Date</td>
        <td><input type="date" name="promotion_dt" id="promotion_dt" value="<?php echo $promotion_date; ?>"></td>
    </tr>
    <tr>
        <td>Height (Inches)</td>
        <td><input type="number" name="height" id="height" value="<?php echo $height_inches; ?>"></td>
    </tr>
    <tr>
        <td>Weight (Kg)</td>
        <td><input type="number" name="weight" id="weight" value="<?php echo $weight_kg; ?>"></td>
    </tr>
    <tr>
        <td>Last Served</td>
        <td><input type="text" name="last_served" id="last_served" value="<?php echo $last_served; ?>"></td>
    </tr>
    <tr>
        <td>Last OPR Marks</td>
        <td><input type="text" name="last_opr_mks" id="last_opr_mks" value="<?php echo $last_opr_marks; ?>"></td>
    </tr>
    <tr>
        <td>Living Status</td>
        <td><input type="text" name="living_status" id="living_status" value="<?php echo $living_status; ?>"></td>
    </tr>
    <tr>
        <td>Sex</td>
        <td>
            <select name="gender" id="gender">
                <option value="Male" <?php if ($gender == 'Male') echo 'selected'; ?>>Male</option>
                <option value="Female" <?php if ($gender == 'Female') echo 'selected'; ?>>Female</option>
            </select>
        </td>
    </tr>
    <tr>
        <td>Rank</td>
        <td><input type="text" name="rank" id="rank" value="<?php echo $rank; ?>"></td>
    </tr>
    <tr>
        <td><input type="submit" value="Submit"></td>
    </tr>
</table>

                    </form>


           
                </div>   
			</div>
			<!-- end #content -->
			<div id="sidebar">
				<ul>
					<li>
						<h2>Aliquam tempus</h2>
						<div id="bg1">
							<div id="bg2">
								<p>Mauris vitae nisl nec metus placerat perdiet est. Phasellus dapibus semper urna. Pellentesque ornare, orci in consectetuer hendrerit, volutpat.</p>
							</div>
						</div>
					</li>
					<li>
						<h2>Actions </h2>
						<div id="bg1">
							<div id="bg2">
								<ul>
									<li><a href="data_entry.php">Data Entry</a></li>
									<li><a href="#">Course</a></li>
									<li><a href="#">Service Age</a></li>
									<li><a href="#">Marital Status</a></li>
									<li><a href="#">Address</a></li>
									<li><a href="#">Competition</a></li>
									<li><a href="#">Good Firer List </a></li>
									<li><a href="#">IPFT</a></li>
									<li><a href="#">RET</a></li>
								</ul>
							</div>
						</div>
					</li>
					<li>
						<h2>Actions</h2>
						<div id="bg1">
							<div id="bg2">
								<ul>
									<li><a href="#">APR</a></li>
									<li><a href="#">Commitment </a></li>
									<li><a href="#">Leave</a></li>
									<li><a href="#">Medical Disposal</a></li>
									<li><a href="#">Command Channel</a></li>
									<li><a href="#">Eligibilty of leave</a></li>
									<li><a href="#">Punishment</a></li>
									<li><a href="#">Family member living state</a></li>
									<li><a href="#">Promotion</a></li>
									<li><a href="#">Posting</a></li>
									<li><a href="#">Qualified for next rank</a></li>
									<li><a href="#">Blood group</a></li>
									<li><a href="#">Svg age wise performance</a></li>
								</ul>
							</div>
						</div>
					</li>
				</ul>
			</div>
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
