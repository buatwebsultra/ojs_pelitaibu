<?php
$conn = new mysqli('localhost', 'root', '', 'db_ojs2026');
if ($conn->connect_error) {
    die("Connection failed: " . $conn->connect_error);
}
$sql = "SHOW TABLES";
$result = $conn->query($sql);
while($row = $result->fetch_row()) {
    echo $row[0] . "\n";
}
$conn->close();
?>
