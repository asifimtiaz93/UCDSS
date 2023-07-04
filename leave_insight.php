<?php
session_start();
include 'conn.php';


if (isset($_SESSION['uname']) && $_SESSION['uname']=='CO'){

    ?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

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
				    <h1> Soldier's Leave Information </h1> </br>
                    <h3>Total Leave state</h3>
                         <!-- <form action="" method="post">
                            
                            <select name="leave_type" id="leave_type">
                                <option value="">Select Leave Type</option>
                                <option value="clve">Casual Leave</option>
                                <option value="plve">Previlege Leave</option>
                                <option value="rlve">Recreation Leave</option>
                            </select>
                            <input type="submit" value="Search">
                        </form> -->

                        
                        <?php
                            // Check if the form is submitted
                         
                                // Get the search input values
                                // $leave_type = $_POST["leave_type"];

                                // Build the query based on the provided inputs
                                $query1 = "
                                select count(Soldier_ID) AS LEAVECOUNT
                                from Granted_Lve, Leave_Register
                                where Granted_Lve.Leave_ID=Leave_Register.Leave_ID and
                                CURRENT_DATE <= To_Dt
                                
                                
                                ";

                                // Execute the query
                                $result = oci_parse($conn, $query1);
                                oci_execute($result);
                                while ($row = oci_fetch_assoc($result)) {
                                    $lve = $row['LEAVECOUNT'];  
                                    echo "Total Soldiers on Lve: " . $row['LEAVECOUNT'] . "<br>";
                                }


                                //------------Second Query---------------------------------


                                $clv_query = "
                                select count(Soldier_ID) AS CLEAVECOUNT
                                from Granted_Lve, Leave_Register
                                where Granted_Lve.Leave_ID=Leave_Register.Leave_ID and
                                CURRENT_DATE <= To_Dt and
                                LEAVE_TYPE = 'clve'
                                
                                
                                ";


                                // Execute the query
                                $result1 = oci_parse($conn, $clv_query);
                                oci_execute($result1);
                                while ($row = oci_fetch_assoc($result1)) {
                                    $clve = $row['CLEAVECOUNT'];
                                    echo "Total Soldires on Casual Leave: " . $row['CLEAVECOUNT'] . "<br>";
                                }
                                
                                //-----------------3rd Query---------------------------------

                                $plv_query = "
                                select count(Soldier_ID) AS PLEAVECOUNT
                                from Granted_Lve, Leave_Register
                                where Granted_Lve.Leave_ID=Leave_Register.Leave_ID and
                                CURRENT_DATE <= To_Dt and
                                

                                LEAVE_TYPE = 'plve'


                                ";
                                // Execute the query
                                $result2 = oci_parse($conn, $plv_query);
                                oci_execute($result2);
                                while ($row = oci_fetch_assoc($result2)) {
                                    $plve = $row['PLEAVECOUNT'];
                                    echo "Total Soldires on Priviledge Leave: " . $row['PLEAVECOUNT'] . "<br>";
                                }
                                

                                //------------------4rth Query---------------------------------

                                $rlv_query = "
                                select count(Soldier_ID) AS RLEAVECOUNT
                                from Granted_Lve, Leave_Register
                                where Granted_Lve.Leave_ID=Leave_Register.Leave_ID and
                                CURRENT_DATE <= To_Dt and

                                LEAVE_TYPE = 'slve'

                                ";
                                // Execute the query
                                $result3 = oci_parse($conn, $rlv_query);
                                oci_execute($result3);
                                while ($row = oci_fetch_assoc($result3)) {
                                    $rlve = $row['RLEAVECOUNT'];
                                    echo "Total Soldires on Sick Leave: " . $row['RLEAVECOUNT'] . "<br>";
                                }
                                ?>
                                <div style=" width:200px; height:200px;">
                                <canvas id="pieChart"></canvas>
                                    <script>
                                    // Get the values from PHP
                                    var value1 = <?php echo $clve; ?>;
                                    var value2 = <?php echo $plve; ?>;
                                    var value3 = <?php echo $rlve; ?>;

                                    // Create the pie chart
                                    var ctx = document.getElementById('pieChart').getContext('2d');
                                    ctx.canvas.width = 100;
                                    ctx.canvas.height = 100;
                                    new Chart(ctx, {
                                        type: 'pie',
                                        data: {
                                            labels: ['casual leave', 'priviledge leave', 'Sick leave'],
                                            datasets: [{
                                                data: [value1, value2, value3],
                                                backgroundColor: ['rgb(255, 99, 132)', 'rgb(54, 162, 235)', 'rgb(255, 205, 86)'],
                                            }]
                                        },
                                        options: {
                                        
                                            // Configure options as needed
                                        }
                                    });
                                    </script>
                                </div>
                                <?php


                                oci_free_statement($result);
                                oci_close($conn);
                            
                            ?>
                    <a href = "lve_indl.php">Individual Leave State</a>

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