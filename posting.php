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
<style>
            .beautiful-table {
                border-collapse: collapse;
                width: 100%;
                background-color: lightgrey;
                color: black;
            }

            .beautiful-table th,
            .beautiful-table td {
                border: 1px solid white;
                padding: 8px;
                text-align: left;
            }

            .beautiful-table th {
                background-color: #999;
            }
            </style>
</head>
<body>
<div id="header">
	<div id="menu">
		<ul>
			<li class="active"><a href="index.php">Homepage</a></li>

			
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
				    <h1> Promotion List </h1> </br>
                    
                    <div>
                       
                         <form action="" method="post">
                           
                            <select name="posting_to" id="posting_to">
                                <option value="">Select Posting To</option>
                                <option value="rab_pgr">RAB and PGR</option>
                                <option value="dgfi_asu_fiu">DGFI,ASU and FIU</option>
                                
                            </select>
                            <input type="submit" value="Search">
                        </form>
                    
                        
                        <?php
                            // Check if the form is submitted
                            if ($_SERVER["REQUEST_METHOD"] == "POST") {

								$selectedOption = $_POST['posting_to'];

								if ($selectedOption === 'rab_pgr') {
									
									$query = "select Sldr_ID, Rank, Sldrs_basic_info.Name, svc_age, Med_cat, Undertakes.result, Undertake_RET.result, Punishment 
									from Sldrs_Basic_Info, Rank, Punishment, Awarded, RET, Undertake_RET, IPFT, Undertakes
									where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
									Undertake_RET.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertake_RET.RET_ID= RET.RET_ID and
									Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Undertakes.IPFT_ID=IPFT.IPFT_ID and 
									Punishment.Punishment_ID=Awarded.Punishment_ID and
									Awarded.Soldier_ID=Sldrs_basic_info.Sldr_ID and
									Med_cat= 'A' and
									Height > 65 and
									Undertakes.result= 'passed' and
									Undertake_RET.result= 'pass' and
									incident ='nil'
									";
									// Execute the query and process the results
									// ...
								} elseif ($selectedOption === 'dgfi_asu_fiu') {
									// Run query for 'lcpl_to_cpl' option
									$query = "
									select DISTINCT Sldr_ID, Rank, Sldrs_basic_info.Name, svc_age, Med_cat, Undertakes.result, Undertake_RET.result,course_name, Punishment 
																		from Sldrs_Basic_Info, Rank, Punishment, Awarded, RET, Undertake_RET, IPFT, Undertakes, courses, completes_course 
																		where Rank.Rank_ID=Sldrs_basic_info.Rank_ID and
																		Undertake_RET.Soldier_ID=Sldrs_basic_info.Sldr_ID and
																		Undertake_RET.RET_ID= RET.RET_ID and
																		Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
																		Undertakes.IPFT_ID=IPFT.IPFT_ID and 
																		Punishment.Punishment_ID=Awarded.Punishment_ID and
																		Awarded.Soldier_ID=Sldrs_basic_info.Sldr_ID and
																		courses.Course_ID=completes_course.Course_ID and
																		completes_course.Soldier_ID=Sldrs_basic_info.Sldr_ID and 
																		
																		Med_cat= 'A' and
																		Undertakes.result= 'passed' and
																		Undertake_RET.result= 'pass' and
																		COMPLETES_COURSE.COURSE_ID in (8, 109) and 
																		Punishment = 'nil'   
									";
									// Execute the query and process the results
									// ...
								} else {
									// Handle the case when no option is selected or an unrecognized option is selected
									// ...
									header('location: 404.php');
								}

                                // Execute the query
                                $result = oci_parse($conn, $query);
                                oci_execute($result);

                                // Create the table header
                                echo "<table class=\"beautiful-table\">
                                    <tr>
                                        <th>Soldier ID</th>
                                        <th>Rank</th>
                                        <th>Soldier Name</th>
                                        <th>IPFT Result</th>
                                        <th>Punishment</th>
                                        <th>Service Age</th>
                                        
                                    </tr>";

                                // Iterate through the query result and display each row in the table
                                while ($row = oci_fetch_assoc($result)) {
                                    echo "<tr>
                                        <td>" . $row['SLDR_ID'] . "</td>
                                        <td>" . $row['RANK'] . "</td>
                                        <td>" . $row['NAME'] . "</td>
                                        <td>" . $row['RESULT'] . "</td>
                                        <td>" . $row['PUNISHMENT'] . "</td>
                                        <td>" . $row['SVC_AGE'] . "</td>
                                    </tr>";
                                }

                                // Close the table
                                echo "</table>";

                                // Clean up
                                oci_free_statement($result);
                                oci_close($conn);
                            }
                            ?>
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