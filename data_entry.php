<?php
session_start();
include 'conn.php';


if (isset($_SESSION['uname'])) {

?>
    <!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Strict//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-strict.dtd">
    <html xmlns="http://www.w3.org/1999/xhtml">

    <head>
        <meta http-equiv="content-type" content="text/html; charset=utf-8" />
        <title>UCDSS</title>
        <link rel="shortcut icon" href="favicon.ico">
        <meta name="keywords" content="" />
        <meta name="description" content="" />
        <link href="style.css" rel="stylesheet" type="text/css" media="screen" />
    </head>
    <script>
        function validateForm() {
            // Get the form input values
            var soldier_id = document.getElementById('soldier_id').value;
            var name = document.getElementById('name').value;
            var trade = document.getElementById('trade').value;
            var marital_status = document.getElementById('marital_status').value;
            var address = document.getElementById('address').value;
            var blood_gp = document.getElementById('blood_gp').value;
            var rank_id = document.getElementById('rank_id').value;
            var age = document.getElementById('age').value;


            // Perform validation
            if (soldier_id == '' || name == '' || trade == '' || marital_status == '' || address == '' || blood_gp == '' || rank_id == '' || age == '') {
                alert('Please fill in all the required fields.');
                return false; // Prevent form submission
            }

            // Validation successful
            return true; // Allow form submission
        }
    </script>

    <body>
        <div id="header">
            <div id="menu">
                <ul>
                    <li class="active"><a href="index.php">Homepage</a></li>
                    <li><a href="#">Blog</a></li>
                    <li><a href="data_entry.php">Data Entry</a></li>

                    <li><a href="login.php">Log In</a></li>
                    <li style="float: right;"><a href="logout.php">Log out &nbsp&nbsp&nbsp<?php echo $_SESSION['uname']; ?></a></li>
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
                            <details>
                                <summary>Soldiers Basic info </summary>
                                <p>
                                <form action="data_entry_exec.php" method="post" onsubmit="return validateForm()">
                                    <table>
                                        <tr>
                                            <td>Solider Id</td>
                                            <td><input type="number" name="soldier_id" id="soldier_id" placeholder="Enter soldier id" class="required-field"></td>
                                        </tr>
                                        <tr>
                                            <td>Name</td>
                                            <td><input type="text" name="name" id="name" placeholder="Enter name"></td>
                                        </tr>
                                        <tr>
                                            <td>Trade</td>
                                            <td><input type="text" name="trade" id="trade" placeholder="Enter trade"></td>
                                        </tr>
                                        <tr>
                                            <td>Marital Status</td>
                                            <td><select name="marital_status" id="marital_status"> 
                                                <option value="Unmarried">Unmarried</option>
                                                <option value="Married">Married</option>
                                                <option value="Divorced">Divorced</option>
                                                </select>
                                            </td>
                                        <tr>
                                            <td>Address</td>
                                            <td><input type="text" name="address" id="address" placeholder="Enter address"></td>
                                        </tr>
                                        <tr>
                                            <td>Blood Group</td>
                                            
                                            
                                            <td><select name="blood_gp" id="blood_gp">
                                                <option value="A+">A+</option>
                                                <option value="A-">A-</option>
                                                <option value="B+">B+</option>
                                                <option value="B-">B-</option>
                                                <option value="AB+">AB+</option>
                                                <option value="AB-">AB-</option>
                                                <option value="O+">O+</option>
                                                <option value="O-">O-</option>
                                                </select></td>
                                        </tr>
                                        <td>Rank ID</td>
                                        <td><input type="number" name="rank_id" id="rank_id" placeholder="Enter rank id"></td>
                                        </tr>
                                        <tr>
                                            <td>Age</td>
                                            <td><input type="number" name="age" id="age" placeholder="Enter age"></td>
                                        </tr>
                                        <tr>
                                            <td>Date of Birth</td>
                                            <td><input type="date" name="dob" id="dob" placeholder="Enter date of birth"></td>
                                        </tr>
                                        <tr>
                                            <td>Service Age</td>
                                            <td><input type="number" name="svc_age" id="svc_age" placeholder="Enter service age"></td>
                                        </tr>
                                        <tr>
                                            <td>Date of Joining</td>
                                            <td><input type="date" name="dt_of_joining" id="dt_of_joining" placeholder="Enter date of joining"></td>
                                        </tr>
                                        <tr>
                                            <td>Mobile Number</td>
                                            <td><input type="number" name="mobile_no" id="mobile_no" placeholder="Enter mobile number"></td>
                                        </tr>
                                        <tr>
                                            <td>Medical Category</td>
                                            <td><select name="med_cat" id="med_cat">
                                                <option value="A">A</option>
                                                <option value="B">B</option>
                                                <option value="C">C</option>
                                                
                                                </select></td>
                                        </tr>
                                        <tr>
                                            <td>Promotion Date</td>
                                            <td><input type="date" name="promotion_dt" id="promotion_dt" placeholder="Enter promotion date"></td>
                                        </tr>
                                        <tr>
                                            <td>Height (Inches)</td>
                                            <td><input type="number" name="height" id="height" placeholder="Enter height"></td>
                                        </tr>
                                        <tr>
                                            <td>Weight (Kg)</td>
                                            <td><input type="number" name="weight" id="weight" placeholder="Enter weight"></td>
                                        </tr>
                                        <tr>
                                            <td>Last Served Unit</td>
                                            <td><input type="text" name="last_served" id="last_served" placeholder="Enter last served"></td>
                                        </tr>
                                        <td>Last Served appt</td>
                                        <td><input type="text" name="last_served_appt" id="last_served_appt" placeholder="Enter last served appt"></td>
                                        </tr>
                                        <tr>
                                            <td>Last APR Marks</td>
                                            <td><input type="number" name="last_opr_mks" id="last_opr_mks" placeholder="Enter last OPR marks"></td>
                                        </tr>

                                        <tr>
                                            <td>Living Status</td>
                                            <td>
                                                <select name="living_status" id="living_status">
                                                    <option value="outliving">Outliving</option>
                                                    <option value="inliving">Inliving</option>
                                                    <option value="line_member">Line Member</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>Gender</td>
                                            <td><select name="gender" id="gender">
                                                    <option value="Male">Male</option>
                                                    <option value="Female">Female</option>
                                                </select>
                                            </td>
                                        </tr>
                                        <tr>

                                        <tr>
                                            <td><input type="submit" value="Submit"></td>
                                        </tr>
                                    </table>
                                </form>
                                </p>
                            </details>
                            <details>
                                <summary>Course Info </summary>
                                <p>
                                <form action="course_data_entry_exec.php" method="post">
                                    <table>
                                        <tr>
                                            <td><label for="course_id">Course ID:</label></td>
                                            <td><input type="number" name="course_id" id="course_id" required></td>
                                        </tr>
                                        <tr>
                                            <td><label for="course_name">Course Name:</label></td>
                                            <td><input type="text" name="course_name" id="course_name" required></td>
                                        </tr>
                                        <tr>
                                            <td><label for="lvl">Level:</label></td>
                                            <td><input type="text" name="lvl" id="lvl"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="submit" value="Submit"></td>
                                        </tr>
                                    </table>
                                </form>

                                </p>
                            </details>
                            <details>
                                <summary>Course Completion Info </summary>   
                                <p>
                                <form action="course_completion_entry_exec.php" method="post">
                                    <table>
                                        <tr>
                                            <td><label for="course_id">Course ID:</label></td>
                                            <td><input type="number" name="course_id" id="course_id" required></td>
                                        </tr>
                                        <tr>
                                            <td><label for="soldier_id">Soldier ID:</label></td>
                                            <td><input type="number" name="soldier_id" id="soldier_id" required></td>
                                        </tr>
                                        <tr>
                                            <td><label for="date_of_completion">Date of Completion:</label></td>
                                            <td><input type="date" name="date_of_completion" id="date_of_completion"></td>
                                        </tr>
                                        <tr>
                                            <td colspan="2"><input type="submit" value="Submit"></td>
                                        </tr>
                                    </table>
                                </form>

                                </p>
                            </details>
                            <details>
                                <summary>Competition Info </summary>
                                <p>
                                    <form action="competition_info_exec.php" method="post">
                                        <table>
                                            <tr>
                                                <td><label for="competition_id">Competition ID:</label></td>
                                                <td><input type="number" name="competition_id" id="competition_id" required></td>
                                            </tr>
                                            <tr>
                                                <td><label for="competition_name">Competition Name:</label></td>
                                                <td><input type="text" name="competition_name" id="competition_name" required></td>
                                            </tr>
                                            <tr>    
                                                <td colspan="2"><input type="submit" value="Submit"></td>
                                                </tr>
                                        </table>
                                    </form>
                                </p>
                            </details>
                            <details>
                                <summary>Competition Participant Info </summary>
                                <p>
                                    <form action="competition_participant_exec.php" method="post">
                                        <table>
                                            <tr>
                                                <td><label for="competition_id">Competition ID:</label></td>
                                                <td><input type="number" name="competition_id" id="competition_id" required></td>
                                            </tr>
                                            <tr>
                                                <td><label for="soldier_id">Soldier ID:</label></td>
                                                <td><input type="number" name="soldier_id" id="soldier_id" required></td> 
                                            </tr>
                                            <tr>
                                                <td colspan="2"><input type="submit" value="Submit"></td>
                                                </tr>
                                        </table>
                                    </form>

                                </p>
                            </details>
                            <details>
                                <summary>IPFT Info </summary>
                                <p>
                                    <form action="ipft_exec.php" method="post">
                                        <table>
                                            <tr>
                                                <td><label for="ipft_id">IPFT ID:</label></td>
                                                <td><input type="number" name="ipft_id" id="ipft_id" required></td> 
                                            </tr>
                                            <tr>
                                                <td> <label for ="ipft_year">IPFT Year:</label></td>
                                                <td><input type="number" name="ipft_year" id="ipft_year" required></td>
                                            </tr>
                                            <tr>
                                                <td> <label for="ipft_period">IPFT Period:</label></td>
                                                <td> <select name="ipft_period" id="ipft_period">
                                                    <option value="1st_Bi-annual">1st Bi-annual</option>
                                                    <option value="2nd_Bi-annual">2nd Bi-annual</option>
                                                    </select>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td colspan="2"><input type="submit" value="Submit"></td>
                                            </tr>
                                        </table>
                                    </form>
                                </p>
                            </details>
                            <details>
                                <summary>IPFT Participant Info </summary>
                                <p>
                                    <form action="ipft_participant_exec.php" method="post">
                                        <table>
                                            <tr>
                                                <td><label for="ipft_id">IPFT ID:</label></td>
                                                <td><input type="number" name="ipft_id" id="ipft_id" required></td> 
                                                </tr>
                                                <tr>
                                                    <td><label for="soldier_id">Soldier ID:</label></td>
                                                    <td><input type="number" name="soldier_id" id="soldier_id" required></td>
                                                </tr>
                                                <tr>
                                                    <td><label for="ipft_result">IPFT Result:</label></td>
                                                    <td> <select name="ipft_result" id="ipft_result">
                                                    <option value="Passed">Passed</option>
                                                    <option value="Failed">Failed</option>
                                                    </select>
                                                </td>
                                                </tr>
                                                <tr>
                                                    <td colspan="2"><input type="submit" value="Submit"></td>
                                                </tr>
                                        </table>
                                    </form>

                                </p>
                            </details>
                            
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
<?php

} else {
    header('location:404.php');
}
?>