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
				    <h1> Service Age Information </h1> </br>
                    
                    <form action="" method="post">
                        <label for="svc_age_from">Choose a Service Age From:</label><br />
                        <input type="number" name="svc_age_from" id="svc_age_from" placeholder="Service Age From"></br>
                        <label for="svc_age_to">Choose a Service Age To:</label><br />
                        <input type="number" name="svc_age_to" id="svc_age_to" placeholder="Service Age To">
                        <input type="submit" value="Search">
                    </form>
                    <?php
                            // Check if the form is submitted
                            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                                // Get the search input values
                                $svc_age_from = $_POST['svc_age_from'];
                                $svc_age_to = $_POST['svc_age_to'];

                                // Build the query based on the provided inputs
                                $query = "
                                select Sldr_ID, Rank, Sldrs_basic_info.Name, Svc_Age 
                                from Sldrs_Basic_Info, Rank
                                where Rank.Rank_ID=Sldrs_basic_info.Rank_ID 
                                ";

             
                                if (!empty($svc_age_from)) {
                                    $query .= " AND Svc_Age >= " . $svc_age_from;
                                }

                                if (!empty($svc_age_to)) {
                                   $query .= " AND Svc_Age <= " . $svc_age_to;
                                }

                                $query .= " ORDER BY Sldr_ID ASC";

                                // Execute the query
                                $result = oci_parse($conn, $query);
                                oci_execute($result);

                                // Create the table header
                                echo "<table class=\"beautiful-table\">
                                    <tr>
                                        <th>Soldier ID</th>
                                        <th>Rank</th>
                                        <th>Name</th>
                                        <th>Service Age</th>
                                    </tr>";

                                // Iterate through the query result and display each row in the table
                                while ($row = oci_fetch_assoc($result)) {
                                    echo "<tr>
                                        <td>" . $row['SLDR_ID'] . "</td>
                                        <td>" . $row['RANK'] . "</td>
                                        <td>" . $row['NAME'] . "</td>
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