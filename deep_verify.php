<?php
$config = parse_ini_file('config.inc.php', true);
$conn = new mysqli($config['database']['host'], $config['database']['username'], $config['database']['password'], $config['database']['name']);

echo "--- Journals Table ---\n";
$res = $conn->query("SELECT * FROM journals");
while($row = $res->fetch_assoc()) {
    print_r($row);
}

echo "\n--- Journal Settings Name ---\n";
$res = $conn->query("SELECT * FROM journal_settings WHERE setting_name = 'name'");
while($row = $res->fetch_assoc()) {
    print_r($row);
}

$conn->close();
?>
