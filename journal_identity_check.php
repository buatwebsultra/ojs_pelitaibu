<?php
$config = parse_ini_file('config.inc.php', true);
$conn = new mysqli($config['database']['host'], $config['database']['username'], $config['database']['password'], $config['database']['name']);

echo "=== JOURNALS MAPPING ===\n";
$res1 = $conn->query("SELECT journal_id, path FROM journals");
while($j = $res1->fetch_assoc()) {
    $id = $j['journal_id'];
    $path = $j['path'];
    
    // Get name
    $res2 = $conn->query("SELECT setting_value FROM journal_settings WHERE journal_id = $id AND setting_name = 'name' LIMIT 1");
    $name = ($row = $res2->fetch_assoc()) ? $row['setting_value'] : "N/A";
    
    // Get abbreviation
    $res3 = $conn->query("SELECT setting_value FROM journal_settings WHERE journal_id = $id AND setting_name = 'abbreviation' LIMIT 1");
    $abbr = ($row = $res3->fetch_assoc()) ? $row['setting_value'] : "N/A";
    
    echo "ID: $id | Path: $path | Abbr: $abbr | Name: $name\n";
}
$conn->close();
?>
