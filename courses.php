<?php
session_start();
include 'conn.php';


if (isset($_SESSION['uname']) && $_SESSION['uname'] == 'CO') {

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
                            <h1>Course Completion Information</h1>
                            <form action="" method="post">
                                <label for="soldier_id">Soldier ID:</label>
                                <input type="number" name="soldier_id" id="soldier_id" placeholder="Enter Soldier ID">
                                <br><br>
                                <select name="course_name" id="course_name">
  <option value="">Select Course</option>
  <option value="Commando">Commando</option>
  <option value="BMR">BMR</option>
  <option value="PE(Cpl to Sgt)">PE(Cpl to Sgt)</option>
  <option value="WO Course">WO Course</option>
  <option value="Database">Database</option>
  <option value="Radio Operator">Radio Operator</option>
  <option value="PE (Snk to Lcpl)">PE (Snk to Lcpl)</option>
  <option value="BTT">BTT</option>
  <option value="PC Snk to Lcpl">PC Snk to Lcpl</option>
  <option value="CDO">CDO</option>
  <option value="HSC">HSC</option>
  <option value="ATT">ATT</option>
  <option value="PC Lcpl to Cpl">PC Lcpl to Cpl</option>
  <option value="NCOC">NCOC</option>
  <option value="PC Cpl to Sgt">PC Cpl to Sgt</option>
</select>

                                <br><br>
                                <input type="submit" value="Search">
                            </form>
                            <?php
                            // Check if the form is submitted
                            if ($_SERVER["REQUEST_METHOD"] == "POST") {
                                // Get the search input values
                                $soldierID = $_POST['soldier_id'];
                                $course_name = $_POST['course_name'];
                               

                                // Build the query based on the provided inputs
                                $query = "
                                SELECT SLDRS_BASIC_INFO.SLDR_ID, SLDRS_BASIC_INFO.NAME, COURSES.COURSE_NAME
                                FROM Courses, Completes_course, Sldrs_Basic_Info
                                WHERE Courses.Course_ID = Completes_course.Course_ID
                                AND Soldier_ID = Sldr_ID   
                                    
                                ";

                                // Add the search conditions to the query if they are provided
                                if (!empty($soldierID)) {
                                    $query .= " AND Soldier_ID = " . $soldierID;
                                }

                                if (!empty($course_name)) {
                                    $query .= " AND COURSES.COURSE_NAME = '" . $course_name . "'";
                                
                                }

                                $query .= " ORDER BY Rank_ID ASC, Sldr_ID ASC";

                                // Execute the query
                                $result = oci_parse($conn, $query);
                                oci_execute($result);

                                // Create the table header
                                echo "<table class=\"beautiful-table\">
                                    <tr>
                                        <th>Soldier Id</th>
                                        <th>Soldier Name</th>
                                        <th>Course Name</th>
                                    </tr>";

                                // Iterate through the query result and display each row in the table
                                while ($row = oci_fetch_assoc($result)) {
                                    echo "<tr>
                                        <td>" . $row["SLDR_ID"] . "</td>
                                        <td>" . $row["NAME"] . "</td>
                                        <td>" . $row["COURSE_NAME"] . "</td>
                                        
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
                <p>&copy; Group6. All rights reserved. Design by <a href="http://gp6.com" rel="nofollow">Group 06</a>.</p>
            </div>
            <!-- end #footer -->
        </div>
    </body>

    </html>
<?php

} else {
    header('location:404.php');
}
?>