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

// Retrieve data
$sql = "SELECT person_id, name, age, gender, race FROM suspect"; // Replace "your_table_name" with your actual table name
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Suspects Dashboard</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f9;
            color: #333;
        }
        .container {
            max-width: 1200px;
            margin: 0 auto;
            padding: 20px;
        }
        h1 {
            text-align: center;
            margin-bottom: 20px;
            color: #444;
        }
        .dashboard-table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background-color: #fff;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }
        .dashboard-table thead {
            background-color: #007bff;
            color: #fff;
        }
        .dashboard-table th,
        .dashboard-table td {
            padding: 15px;
            text-align: left;
            border: 1px solid #ddd;
        }
        .dashboard-table tbody tr:hover {
            background-color: #f1f1f1;
        }
        .action-btn {
            padding: 8px 12px;
            text-decoration: none;
            border-radius: 5px;
            font-weight: bold;
            color: #fff;
            border: none;
            cursor: pointer;
        }
        .edit-btn {
            background-color: #ffc107;
        }
        .edit-btn:hover {
            background-color: #e0a800;
        }
        .archive-btn {
            background-color: #dc3545;
        }
        .archive-btn:hover {
            background-color: #c82333;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Suspects Dashboard</h1>
        <?php if ($result->num_rows > 0): ?>
            <table class="dashboard-table">
                <thead>
                    <tr>
                        <th>Person ID</th>
                        <th>Name</th>
                        <th>Age</th>
                        <th>Gender</th>
                        <th>Race</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td><?= $row['person_id'] ?></td>
                            <td><?= htmlspecialchars($row['name']) ?></td>
                            <td><?= $row['age'] ?></td>
                            <td><?= $row['gender'] ?></td>
                            <td><?= $row['race'] ?></td>
                            <td>
                                <form action="actions.php" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="person_id" value="<?= $row['person_id'] ?>">
                                    <button type="submit" class="action-btn edit-btn">Edit</button>
                                </form>
                                <form action="actions.php" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="archive">
                                    <input type="hidden" name="person_id" value="<?= $row['person_id'] ?>">
                                    <button type="submit" class="action-btn archive-btn">Archive</button>
                                </form>
                            </td>
                        </tr>
                    <?php endwhile; ?>
                </tbody>
            </table>
        <?php else: ?>
            <p>No data found.</p>
        <?php endif; ?>
        <?php $conn->close(); ?>
    </div>
</body>
</html>
