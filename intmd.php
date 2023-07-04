<?php
if (isset($_POST['update_button'])) {
    //update action
    header("Location: update_form.php");
} else if (isset($_POST['delete_button'])) {
    //delete action
    header("Location: delete_row.php");
} else {
    //no button pressed
}
?>