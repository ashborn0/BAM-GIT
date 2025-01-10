<?php
include 'db_connect.php';

if ($_SERVER['REQUEST_METHOD'] == 'POST') {
    // Check if the 'action' field is set
    if (isset($_POST['action'])) {
        $action = $_POST['action'];

        if ($action == 'Register') {
            // Handle registration
            $firstname = $conn->real_escape_string($_POST['firstname']);
            $lastname = $conn->real_escape_string($_POST['lastname']);
            $email = $conn->real_escape_string($_POST['email']);
            $password = password_hash($_POST['password'], PASSWORD_BCRYPT);
            $gender = $conn->real_escape_string($_POST['gender']); // Get gender
        
            $check_email_query = "SELECT id FROM users WHERE email = '$email'";
            $result = $conn->query($check_email_query);
        
            if ($result->num_rows > 0) {
                echo "<script>alert('Email already exists. Please try a different one.'); window.location.href = 'home.php';</script>";
            } else {
                $insert_query = "INSERT INTO users (firstname, lastname, email, password_hash, gender) 
                                 VALUES ('$firstname', '$lastname', '$email', '$password', '$gender')";
                if ($conn->query($insert_query)) {
                    echo "<script>alert('Registration successful!'); window.location.href = 'home.php';</script>";
                } else {
                    echo "<script>alert('Error: " . $conn->error . "'); window.location.href = 'home.php';</script>";
                }
            }
        } elseif ($action == 'Sign In') {
            // Handle login
            $email = $conn->real_escape_string($_POST['email']);
            $password = $_POST['password'];

            $fetch_user_query = "SELECT * FROM users WHERE email = '$email'";
            $result = $conn->query($fetch_user_query);

            if ($result->num_rows > 0) {
                $user = $result->fetch_assoc();
                if (password_verify($password, $user['password_hash'])) {
                    session_start();
                    $_SESSION['user'] = $user;
                    header("Location: dashboard.php");
                    exit();
                } else {
                    echo "<script>alert('Invalid email or password.'); window.location.href = 'home.php';</script>";
                }
            } else {
                echo "<script>alert('Invalid email or password.'); window.location.href = 'home.php';</script>";
            }
        } else {
            echo "<script>alert('Invalid action.'); window.location.href = 'home.php';</script>";
        }
    } else {
        echo "<script>alert('Action is not defined.'); window.location.href = 'home.php';</script>";
    }
} else {
    echo "<script>alert('Invalid request method.'); window.location.href = 'home.php';</script>";
}
?>
