<?php
require_once('c:/xampp/htdocs/ojs/config.inc.php');
$conn = mysqli_connect(
    Config::getVar('database', 'host'),
    Config::getVar('database', 'username'),
    Config::getVar('database', 'password'),
    Config::getVar('database', 'name')
);

if (!$conn) {
    die("Connection failed: " . mysqli_connect_error());
}

$q_journals = "SELECT journal_id, path FROM journals";
$res_journals = mysqli_query($conn, $q_journals);
while($j = mysqli_fetch_assoc($res_journals)) {
    echo "Journal ID: " . $j['journal_id'] . " Path: " . $j['path'] . "\n";
}
echo "-----------------------------------\n";

$query = "SELECT * FROM plugin_settings WHERE (setting_value LIKE '%INDEXED%' OR setting_value LIKE '%Index%') AND context_id != 0";
$result = mysqli_query($conn, $query);

if ($result) {
    while ($row = mysqli_fetch_assoc($result)) {
        echo "Plugin Name: " . $row['plugin_name'] . " Context ID: " . $row['context_id'] . " Setting: " . $row['setting_name'] . "\n";
        echo "Value Start: " . substr($row['setting_value'], 0, 100) . "\n";
        echo "-----------------------------------\n";
    }
} else {
    echo "No results found or error in query.\n";
}

mysqli_close($conn);
?>
