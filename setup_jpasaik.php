<?php
/**
 * Set current issue and add journal descriptions for JPASAIK
 */
$db = new mysqli('localhost', 'root', '', 'db_ojs2026');

if ($db->connect_error) {
    die("Connection failed: " . $db->connect_error);
}

// 1. Set Current Issue to the latest published (issue_id=12, Vol 4 No 3 2024)
echo "=== Setting Current Issue ===\n";

// Check if currentIssueId already exists
$r = $db->query("SELECT * FROM journal_settings WHERE journal_id=1 AND setting_name='currentIssueId'");
if ($r->num_rows > 0) {
    $db->query("UPDATE journal_settings SET setting_value='12' WHERE journal_id=1 AND setting_name='currentIssueId'");
    echo "Updated currentIssueId to 12\n";
} else {
    $db->query("INSERT INTO journal_settings (journal_id, locale, setting_name, setting_value) VALUES (1, '', 'currentIssueId', '12')");
    echo "Inserted currentIssueId = 12\n";
}

// 2. Set Journal Description (en_US)
echo "\n=== Setting en_US Description ===\n";
$desc_en = '<p><strong>Jurnal Pelita Sains Kesehatan (JPASAIK)</strong> is a peer-reviewed, open access scientific journal in health sciences published by STIKES Pelita Ibu, Kendari. Published four times a year, JPASAIK disseminates original research, reviews, and case studies across nursing, midwifery, public health, and allied health disciplines.</p>';

$r = $db->query("SELECT * FROM journal_settings WHERE journal_id=1 AND setting_name='description' AND locale='en_US'");
if ($r->num_rows > 0) {
    $stmt = $db->prepare("UPDATE journal_settings SET setting_value=? WHERE journal_id=1 AND setting_name='description' AND locale='en_US'");
    $stmt->bind_param('s', $desc_en);
    $stmt->execute();
    echo "Updated en_US description\n";
} else {
    $stmt = $db->prepare("INSERT INTO journal_settings (journal_id, locale, setting_name, setting_value) VALUES (1, 'en_US', 'description', ?)");
    $stmt->bind_param('s', $desc_en);
    $stmt->execute();
    echo "Inserted en_US description\n";
}

// 3. Set Journal Description (id_ID)
echo "\n=== Setting id_ID Description ===\n";
$desc_id = '<p><strong>Jurnal Pelita Sains Kesehatan (JPASAIK)</strong> adalah jurnal ilmiah peer-reviewed dan akses terbuka di bidang ilmu kesehatan yang diterbitkan oleh STIKES Pelita Ibu, Kendari. Terbit empat kali setahun, JPASAIK menerbitkan riset orisinal, artikel review, dan studi kasus dalam bidang keperawatan, kebidanan, kesehatan masyarakat, dan ilmu kesehatan lainnya.</p>';

$r = $db->query("SELECT * FROM journal_settings WHERE journal_id=1 AND setting_name='description' AND locale='id_ID'");
if ($r->num_rows > 0) {
    $stmt = $db->prepare("UPDATE journal_settings SET setting_value=? WHERE journal_id=1 AND setting_name='description' AND locale='id_ID'");
    $stmt->bind_param('s', $desc_id);
    $stmt->execute();
    echo "Updated id_ID description\n";
} else {
    $stmt = $db->prepare("INSERT INTO journal_settings (journal_id, locale, setting_name, setting_value) VALUES (1, 'id_ID', 'description', ?)");
    $stmt->bind_param('s', $desc_id);
    $stmt->execute();
    echo "Inserted id_ID description\n";
}

echo "\n=== DONE ===\n";
echo "Current Issue: 12 (Vol 4 No 3 2024)\n";
echo "Descriptions set for en_US and id_ID\n";

$db->close();
