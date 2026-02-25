<?php
// Database Search Tool for OJS
include('config.inc.php');

// Extract db settings from config.inc.php manually or use a simple parser
$config = parse_ini_file('config.inc.php', true);
$dbHost = $config['database']['host'];
$dbUser = $config['database']['username'];
$dbPass = $config['database']['password'];
$dbName = $config['database']['name'];

$conn = new mysqli($dbHost, $dbUser, $dbPass, $dbName);
if ($conn->connect_error) { die("Connection failed: " . $conn->connect_error); }

$searchTerm = 'localhost/ojs';
$results = [];

// Get all tables
$tables = [];
$res = $conn->query("SHOW TABLES");
while($row = $res->fetch_array()) {
    $tables[] = $row[0];
}

foreach($tables as $table) {
    // Get all columns for this table
    $columns = [];
    $resCol = $conn->query("SHOW COLUMNS FROM $table");
    while($colRow = $resCol->fetch_assoc()) {
        $columns[] = $colRow['Field'];
    }
    
    foreach($columns as $column) {
        $query = "SELECT * FROM $table WHERE `$column` LIKE '%$searchTerm%'";
        $resSearch = $conn->query($query);
        if ($resSearch && $resSearch->num_rows > 0) {
            while($match = $resSearch->fetch_assoc()) {
                $results[] = [
                    'table' => $table,
                    'column' => $column,
                    'count' => $resSearch->num_rows
                ];
                break; // Just need to know it's there
            }
        }
    }
}

echo "<h1>Search Results for '$searchTerm'</h1>";
if (empty($results)) {
    echo "<p>No matches found in database.</p>";
} else {
    echo "<ul>";
    foreach($results as $res) {
        echo "<li>Table: <strong>{$res['table']}</strong> | Column: <strong>{$res['column']}</strong></li>";
    }
    echo "</ul>";
}
?>
