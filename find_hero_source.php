<?php
mysqli_report(MYSQLI_REPORT_ERROR | MYSQLI_REPORT_STRICT);
$c = new mysqli('localhost', 'root', '', 'db_ojs2026');
if ($c->connect_error) die("Connection failed: " . $c->connect_error);

$res = $c->query("SELECT setting_name, setting_value FROM journal_settings WHERE journal_id = 1 AND setting_value LIKE '%premium-hero%'");
while($row = $res->fetch_assoc()) {
    echo "--- Setting: {$row['setting_name']} ---\n";
    echo $row['setting_value'] . "\n\n";
}

$res = $c->query("SELECT setting_name, setting_value FROM plugin_settings WHERE context_id = 1 AND setting_value LIKE '%premium-hero%'");
while($row = $res->fetch_assoc()) {
    echo "--- Plugin Setting: {$row['setting_name']} ---\n";
    echo $row['setting_value'] . "\n\n";
}

$c->close();
?>
