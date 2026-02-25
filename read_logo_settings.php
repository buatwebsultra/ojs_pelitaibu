<?php
$config = parse_ini_file('config.inc.php', true);
$conn = new mysqli($config['database']['host'], $config['database']['username'], $config['database']['password'], $config['database']['name']);

$res = $conn->query("SELECT journal_id, setting_name, setting_value, locale FROM journal_settings WHERE setting_name IN ('pageHeaderTitleImage', 'pageHeaderLogoImage')");
while($row = $res->fetch_assoc()){
    echo "ID: " . $row['journal_id'] . " | " . $row['setting_name'] . " (" . $row['locale'] . "): " . $row['setting_value'] . "\n\n";
}
$conn->close();
?>
