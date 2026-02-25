<?php
/**
 * JPASAIK Seamless Full-Width Banner
 * 
 * Removes all padding/margins/borders to make 
 * the banner logo (1160x250) fill the entire width.
 */

$c = new mysqli('localhost', 'root', '', 'db_ojs2026');
if ($c->connect_error) die("Connection failed: " . $c->connect_error);

$jId = 1;

$seamless_banner_css = "
<style>
/* --- JPASAIK Seamless Full-Width Banner --- */

/* Reset Head Structure to absolute full width */
.pkp_structure_head {
    background: #ffffff !important;
    padding: 0 !important;
    margin: 0 !important;
    max-width: none !important;
    width: 100% !important;
    border: none !important;
}

.pkp_head_wrapper {
    max-width: none !important;
    width: 100% !important;
    padding: 0 !important;
    margin: 0 !important;
}

/* Removal of internal OJS padding for site name */
.pkp_site_name_wrapper {
    padding: 0 !important;
    margin: 0 !important;
    width: 100% !important;
    max-width: none !important;
}

.pkp_site_name {
    padding: 0 !important;
    margin: 0 !important;
    width: 100% !important;
}

/* Force Image to be full-bleed */
.header_banner_img {
    width: 100% !important;
    height: auto !important;
    max-width: none !important;
    display: block !important;
    border: none !important;
    margin: 0 !important;
}

/* Ensure no skip-link navigation gaps show up */
.cmp_skip_to_content {
    position: absolute !important;
    top: -100px !important; /* Hide off-screen but keep for accessibility */
}

/* Maintain Hero Removal */
.journal_hero, .hero_content, .homepage_image {
    display: none !important;
}
</style>
";

$stmt = $c->prepare("UPDATE plugin_settings SET setting_value = ? WHERE plugin_name = 'customheaderplugin' AND setting_name = 'content' AND context_id = ?");
$stmt->bind_param("si", $seamless_banner_css, $jId);
$stmt->execute();

if ($stmt->affected_rows > 0) {
    echo "SUCCESS: Seamless Full-Width Banner applied for JPASAIK (ID 1).\n";
} else {
    echo "NOTICE: No changes made (already applied or error).\n";
}

$c->close();
?>
