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

// Retrieve data with actual names
$sql = "
    SELECT 
        i.incident_id,
        s.name AS person_name,
        i.date,
        `mod`.manner_of_death,
        a.armed,
        t.threat_level,
        f.flee,
        i.city,
        i.state,
        ac.arms_category,
        i.year
    FROM 
        incident AS i
    LEFT JOIN suspect AS s ON i.person_id = s.person_id
    LEFT JOIN manner_of_death AS `mod` ON i.manner_of_death_id = `mod`.manner_of_death_id
    LEFT JOIN armed AS a ON i.armed_id = a.armed_id
    LEFT JOIN threat_level AS t ON i.threat_level_id = t.threat_level_id
    LEFT JOIN flee AS f ON i.flee_id = f.flee_id
    LEFT JOIN arms_category AS ac ON i.arms_category_id = ac.arms_category_id
";
$result = $conn->query($sql);
?>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Crimes Dashboard</title>
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
        <h1>Crimes Dashboard</h1>
        <?php if ($result->num_rows > 0): ?>
            <table class="dashboard-table">
                <thead>
                    <tr>
                        <th>Incident ID</th>
                        <th>Person Name</th>
                        <th>Date</th>
                        <th>Manner of Death</th>
                        <th>Armed</th>
                        <th>Threat Level</th>
                        <th>Flee</th>
                        <th>City</th>
                        <th>State</th>
                        <th>Arms Category</th>
                        <th>Year</th>
                        <th>Actions</th>
                    </tr>
                </thead>
                <tbody>
                    <?php while ($row = $result->fetch_assoc()): ?>
                        <tr>
                            <td><?= $row['incident_id'] ?></td>
                            <td><?= htmlspecialchars($row['person_name']) ?></td>
                            <td><?= $row['date'] ?></td>
                            <td><?= htmlspecialchars($row['manner_of_death']) ?></td>
                            <td><?= htmlspecialchars($row['armed']) ?></td>
                            <td><?= htmlspecialchars($row['threat_level']) ?></td>
                            <td><?= htmlspecialchars($row['flee']) ?></td>
                            <td><?= htmlspecialchars($row['city']) ?></td>
                            <td><?= htmlspecialchars($row['state']) ?></td>
                            <td><?= htmlspecialchars($row['arms_category']) ?></td>
                            <td><?= $row['year'] ?></td>
                            <td>
                                <form action="actions.php" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="edit">
                                    <input type="hidden" name="incident_id" value="<?= $row['incident_id'] ?>">
                                    <button type="submit" class="action-btn edit-btn">Edit</button>
                                </form>
                                <form action="actions.php" method="post" style="display:inline;">
                                    <input type="hidden" name="action" value="archive">
                                    <input type="hidden" name="incident_id" value="<?= $row['incident_id'] ?>">
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
