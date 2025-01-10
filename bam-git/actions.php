<?php
// Database connection
$servername = "localhost";
$username = "root"; // Replace with your database username
$password = ""; // Replace with your database password
$dbname = "Crimes_db"; // Replace with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $action = $_POST['action'];
    $person_id = $_POST['person_id'];

    if ($action === 'edit') {
        // Redirect to an edit page (you need to create edit.php)
        header("Location: edit.php?person_id=$person_id");
        exit();
    } elseif ($action === 'archive') {
        // Mark the record as archived (update database)
        $sql = "UPDATE suspect SET archived = 1 WHERE person_id = $person_id"; // Ensure you have an "archived" column
        if ($conn->query($sql) === TRUE) {
            echo "Person with ID $person_id archived successfully.";
        } else {
            echo "Error: " . $conn->error;
        }
    }
}

$conn->close();
?>
