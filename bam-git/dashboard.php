<?php
session_start();
if (!isset($_SESSION['user'])) {
    header("Location: index.php");
    exit();
}
$user = $_SESSION['user'];
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="style1.css">
    <link
        href="https://fonts.googleapis.com/css2?family=Roboto:wght@100;300;400;500;700;900&family=Sen:wght@400;700;800&display=swap"
        rel="stylesheet">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.2/css/all.min.css">

    <title>Movies-io</title>
</head>
<body>
              
    

    <div class="navbar">
        <div class="navbar-container">
            <div class="logo-container">
           
                <h1 class="logo">CDO POLICE DEPARTMENT</h1>
            </div>
            <div class="menu-container">
                <ul class="menu-list">
                    <li class="menu-list-item active">Home</li>
                    <li><a href="suspects.php" class="link">Suspects</a></li>
                    <li><a href="sus-dash.php" class="link">Dashboard</a></li>
                    <li class="menu-list-item"></li>
                    <li class="menu-list-item"></li>

                </ul>
            </div>
            <div class="profile-container">
                <img class="profile-picture" src="images/profiles.jpg" alt="">
                <div class="profile-text-container">
                    <span class="profile-text">Profile</span>s
                    <i class="fas fa-caret-down"></i>
                </div>
                <div class="toggle">
                    <i class="fas fa-moon toggle-icon"></i>
                    <i class="fas fa-sun toggle-icon"></i>
                    <div class="toggle-ball"></div>
                </div>
            </div>
        </div>
    </div>
    <div class="sidebar">
        <i class="left-menu-icon fas fa-search"></i>
        <i class="left-menu-icon fas fa-home"></i>
        <i class="left-menu-icon fas fa-users"></i>
    </div>
    <?php
// Database connection
$servername = "localhost";
$username = "root"; // Replace with your database username
$password = ""; // Replace with your database password
$dbname = "crimes_db"; // Replace with your database name

// Create connection
$conn = new mysqli($servername, $username, $password, $dbname);

// Check connection
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}

if ($_SERVER["REQUEST_METHOD"] === "POST") {
    // Sanitize and validate input
    $incident_id = htmlspecialchars($_POST['incident_id']);
    $person_name = htmlspecialchars($_POST['person_name']);
    $date = htmlspecialchars($_POST['date']);
    $manner_of_death = htmlspecialchars($_POST['manner_of_death']);
    $armed = htmlspecialchars($_POST['armed']);
    $threat_level = htmlspecialchars($_POST['threat_level']);
    $flee = htmlspecialchars($_POST['flee']);
    $city = htmlspecialchars($_POST['city']);
    $state = htmlspecialchars($_POST['state']);
    $arms_category = htmlspecialchars($_POST['arms_category']);
    $year = (int)$_POST['year'];

    // Insert into database
    $sql = "INSERT INTO incidents (incident_id, person_name, date, manner_of_death, armed, threat_level, flee, city, state, arms_category, year) VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
    $stmt = $conn->prepare($sql);
    $stmt->bind_param("ssssssssssi", $incident_id, $person_name, $date, $manner_of_death, $armed, $threat_level, $flee, $city, $state, $arms_category, $year);

    if ($stmt->execute()) {
        header("Location: /dashboard.php"); // Redirect to the dashboard after successful addition
        exit();
    } else {
        echo "<p>Error: " . $conn->error . "</p>";
    }

    $stmt->close();
}

$conn->close();
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Add Incident</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            color: #333;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        .form-container {
            background: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 400px;
        }
        .form-container h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #444;
        }
        .form-container label {
            display: block;
            margin-bottom: 5px;
            font-weight: bold;
        }
        .form-container input, .form-container select, .form-container button {
            width: 100%;
            padding: 10px;
            margin-bottom: 15px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-container button {
            background-color: #007bff;
            color: #fff;
            font-weight: bold;
            border: none;
            cursor: pointer;
        }
        .form-container button:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <div class="form-container">
        <h1>Add Incident</h1>
        <form method="POST" action="">
            <label for="incident_id">Incident ID</label>
            <input type="text" id="incident_id" name="incident_id" required>

            <label for="person_name">Person Name</label>
            <input type="text" id="person_name" name="person_name" required>

            <label for="date">Date</label>
            <input type="date" id="date" name="date" required>

            <label for="manner_of_death">Manner of Death</label>
            <select id="manner_of_death" name="manner_of_death" required>
                <option value="">Select...</option>
                <option value="Shooting">Shooting</option>
                <option value="Taser">Taser</option>
                <option value="Physical Force">Physical Force</option>
            </select>

            <label for="armed">Armed</label>
            <select id="armed" name="armed" required>
                <option value="">Select...</option>
                <option value="Firearm">Firearm</option>
                <option value="Knife">Knife</option>
                <option value="Unarmed">Unarmed</option>
            </select>

            <label for="threat_level">Threat Level</label>
            <select id="threat_level" name="threat_level" required>
                <option value="">Select...</option>
                <option value="Low">Low</option>
                <option value="Medium">Medium</option>
                <option value="High">High</option>
            </select>

            <label for="flee">Flee</label>
            <select id="flee" name="flee" required>
                <option value="">Select...</option>
                <option value="Foot">Foot</option>
                <option value="Car">Car</option>
                <option value="Not fleeing">Not fleeing</option>
            </select>

            <label for="city">City</label>
            <input type="text" id="city" name="city" required>

            <label for="state">State</label>
            <select id="state" name="state" required>
                <option value="">Select...</option>
                <option value="CA">California</option>
                <option value="TX">Texas</option>
                <option value="NY">New York</option>
                <!-- Add more states as needed -->
            </select>

            <label for="arms_category">Arms Category</label>
            <select id="arms_category" name="arms_category" required>
                <option value="">Select...</option>
                <option value="Handgun">Handgun</option>
                <option value="Rifle">Rifle</option>
                <option value="Non-lethal">Non-lethal</option>
            </select>

            <label for="year">Year</label>
            <input type="number" id="year" name="year" required>

            <button type="submit">Add Incident</button>
        </form>
    </div>
</body>
</html>
