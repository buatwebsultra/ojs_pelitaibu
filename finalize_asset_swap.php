<?php
$f1 = "c:/xampp/htdocs/ojs/public/journals/1/";
$f2 = "c:/xampp/htdocs/ojs/public/journals/2/";

echo "--- Finalizing Physical Asset Swap ---\n";

// 1. STYLESHEETS
// I will create a function to apply designs
function applyDesign($filePath, $primary, $secondary, $accent, $label) {
    if (!file_exists($filePath)) return;
    $content = file_get_contents($filePath);
    
    // Replace JPASAIK header colors if they exist
    $content = preg_replace('/linear-gradient\(180deg, #[0-9a-fA-F]{6} 0%, #[0-9a-fA-F]{6} 100%\) !important; \/\* JPASAIK Navy \*\//', "linear-gradient(180deg, $primary 0%, $secondary 100%) !important; /* $label Primary */", $content);
    $content = preg_replace('/linear-gradient\(180deg, #[0-9a-fA-F]{6} 0%, #[0-9a-fA-F]{6} 100%\) !important; \/\* MEDAN Deep Blue \*\//', "linear-gradient(180deg, $primary 0%, $secondary 100%) !important; /* $label Primary */", $content);
    
    // Replace accents
    // We'll be more generic here to ensure it works
    // JPASAIK colors: #011d3a, #0076a3
    // MEDAN colors: #1a3a5f, #8b0000
    
    // Target specific blocks we know of
    // Header before (accent line)
    $content = preg_replace('/background: linear-gradient\(90deg, #[0-9a-fA-F]{6}, #[0-9a-fA-F]{6}, #[0-9a-fA-F]{6}\) !important; \/\* (JPASAIK|MEDAN) [A-Za-z ]+ \*\//', "background: linear-gradient(90deg, $accent, #c0392b, $accent) !important; /* $label Accent */", $content);
    
    // Navigation top border
    $content = preg_replace('/border-top: 3px solid #[0-9a-fA-F]{6} !important; \/\* (JPASAIK|MEDAN) [A-Za-z ]+ \*\//', "border-top: 3px solid $accent !important; /* $label Accent */", $content);
    
    // If we can't find specific comments, we'll use a more aggressive approach for the main colors
    // Navy -> Primary
    $content = str_replace('#011d3a', $primary, $content);
    // Teal -> Accent
    $content = str_replace('#0076a3', $accent, $content);
    // Deep Blue -> Primary
    $content = str_replace('#1a3a5f', $primary, $content);
    // Maroon -> Accent
    $content = str_replace('#8b0000', $accent, $content);
    
    file_put_contents($filePath, $content);
    echo "Design applied to $filePath: $label\n";
}

// Apply JPASAIK to Folder 1
applyDesign($f1 . "styleSheet.css", "#011d3a", "#01243f", "#0076a3", "JPASAIK");

// Apply MEDAN to Folder 2
applyDesign($f2 . "styleSheet.css", "#1a3a5f", "#102a43", "#8b0000", "MEDAN");

// 2. ASSET MOVEMENT
// Move Medan assets out of F1 if they are there
$medanAssets = ['headerrMedan_en.png', 'homepageMedan_en.png', 'homepageMedan_id.png', 'pageHeaderLogoImage_id_ID.png'];
foreach($medanAssets as $a) {
    if (file_exists($f1 . $a)) {
        echo "Moving $a to Folder 2...\n";
        @rename($f1 . $a, $f2 . $a);
    }
}

// There might be a logo clash if both named same, but usually they have timestamps or unique names in DB
// Let's check for pageHeaderLogoImage_en_US.png
if (file_exists($f1 . "pageHeaderLogoImage_en_US.png") && file_exists($f2 . "pageHeaderLogoImage_en_US.png")) {
    // Both exist. We might need to swap them.
    // For now let's just assume we need to swap them because they are likely tertukar.
    $tmp = "c:/xampp/htdocs/ojs/public/journals/logo_tmp.png";
    rename($f1 . "pageHeaderLogoImage_en_US.png", $tmp);
    rename($f2 . "pageHeaderLogoImage_en_US.png", $f1 . "pageHeaderLogoImage_en_US.png");
    rename($tmp, $f2 . "pageHeaderLogoImage_en_US.png");
    echo "Swapped pageHeaderLogoImage_en_US.png between F1 and F2\n";
}

echo "Asset swap complete.\n";
?>
