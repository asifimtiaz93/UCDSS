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
				    <h1> IPFT Information </h1> </br>
                    <h3>Total IPFT state</h3>
                         <form action="" method="post">
                            <input type="number" name="ipft_year" id="ipft_year" placeholder="Search by Year">
                            <select name="ipft_period" id="ipft_period">
                                <option value="">Select Result</option>
                                <option value="1st_bi-annual">1st Bi annual</option>
                                <option value="2nd_bi-annual">2nd Bi annual</option>
                            </select>
                            <input type="submit" value="Search">
                        </form>

                        
                        <?php
                            // Check if the form is submitted
                            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                                // Get the search input values
                                $ipft_year = $_POST['ipft_year'];
                                $ipft_period = $_POST['ipft_period'];

                                // Build the query based on the provided inputs
                                $query1 = "
                                select count(Result) AS PASSCOUNT
                                from Sldrs_Basic_Info, IPFT,  Undertakes            
                                where  Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
                                Undertakes.IPFT_ID=IPFT.IPFT_ID and
                                Result= 'passed'
                                
                                
                                ";

                                //Add the search conditions to the query if they are provided
                                if (!empty($ipft_year)) {
                                    $query1 .= " AND YEAR = " . $ipft_year;
                                }

                                if (!empty($ipft_period)) {
                                    $query1 .= " AND PERIOD = '" . $ipft_period . "'";
                                }


                                // Execute the query
                                $result = oci_parse($conn, $query1);
                                oci_execute($result);
                                while ($row = oci_fetch_assoc($result)) {
                                    $pass = $row['PASSCOUNT'];  
                                    echo "Total Passed IPFT: " . $row['PASSCOUNT'] . "<br>";
                                }


                                //------------Second Query---------------------------------


                                $query2 = "
                                select count(Result) AS FAILCOUNT
                                from Sldrs_Basic_Info, IPFT,  Undertakes            
                                where  Undertakes.Soldier_ID=Sldrs_basic_info.Sldr_ID and
                                Undertakes.IPFT_ID=IPFT.IPFT_ID and
                                Result= 'failed'
                                
                                
                                ";

                                //Add the search conditions to the query if they are provided
                                if (!empty($ipft_year)) {
                                    $query2 .= " AND YEAR = " . $ipft_year;
                                }

                                if (!empty($ipft_period)) {
                                    $query2 .= " AND PERIOD = '" . $ipft_period . "'";
                                }


                                // Execute the query
                                $result = oci_parse($conn, $query2);
                                oci_execute($result);
                                while ($row = oci_fetch_assoc($result)) {
                                    $fail = $row['FAILCOUNT'];
                                    echo "Total Failed IPFT: " . $row['FAILCOUNT'] . "<br>";
                                }
                                
                                
                                
                                ?>
                                <div style=" width:200px; height:200px;">
                                <canvas id="pieChart"></canvas>
                                    <script>
                                    // Get the values from PHP
                                    var value1 = <?php echo $pass; ?>;
                                    var value2 = <?php echo $fail; ?>;

                                    // Create the pie chart
                                    var ctx = document.getElementById('pieChart').getContext('2d');
                                    ctx.canvas.width = 100;
                                    ctx.canvas.height = 100;
                                    new Chart(ctx, {
                                        type: 'pie',
                                        data: {
                                            labels: ['Pass', 'Fail'],
                                            datasets: [{
                                                data: [value1, value2],
                                                backgroundColor: ['rgb(255, 99, 132)', 'rgb(54, 162, 235)'],
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
                            }
                            ?>
                    <a href = "ipft_indl.php">Individual IPFT</a>

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