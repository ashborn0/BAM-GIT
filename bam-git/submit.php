<?php
if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    if (!empty($_POST['selected_ids'])) {
        $selected_ids = $_POST['selected_ids'];
        echo "Selected Person IDs: " . implode(", ", $selected_ids);
    } else {
        echo "No persons selected.";
    }
} else {
    echo "Invalid request.";
}
?>
