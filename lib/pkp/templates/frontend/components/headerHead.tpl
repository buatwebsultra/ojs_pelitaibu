{**
 * templates/frontend/components/headerHead.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2000-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Common site header <head> tag and contents.
 *}
<head>
	<meta charset="{$defaultCharset|escape}">
	<meta name="viewport" content="width=device-width, initial-scale=1.0">
	<title>
		{$pageTitleTranslated|strip_tags}
		{* Add the journal name to the end of page titles *}
		{if $requestedPage|escape|default:"index" != 'index' && $currentContext && $currentContext->getLocalizedName()}
			| {$currentContext->getLocalizedName()}
		{/if}
	</title>

	{if $currentContext && $currentContext->getPath() == 'jpasaik'}
		<meta name="description" content="Jurnal Pelita Sains Kesehatan (JPASAIK) is a peer-reviewed open access journal focusing on Midwifery, Hospital Administration, Pharmacy, and Health Sciences. Published by STIKES Pelita Ibu.">
		<meta name="keywords" content="Midwifery, Health Science, Pharmacy, Hospital Administration, Jurnal Pelita Sains Kesehatan, JPASAIK, STIKES Pelita Ibu">
		<meta property="og:title" content="Jurnal Pelita Sains Kesehatan | JPASAIK">
		<meta property="og:description" content="Official Journal of STIKES Pelita Ibu - Peer-Reviewed Home for Health Research in Midwifery and Pharmacy.">
		<meta property="og:type" content="website">
		<meta property="og:image" content="{$publicFilesDir}/pageHeaderLogoImage_Final_Proper_v10.png">
	{elseif !$currentContext}
		<meta name="description" content="Portal E-Journal STIKES Pelita Ibu - Pusat Publikasi Ilmiah dan Riset Kesehatan Terintegrasi (Kebidanan, Farmasi, Administrasi Rumah Sakit).">
		<meta name="keywords" content="Portal Jurnal, STIKES Pelita Ibu, Jurnal Kesehatan, Kebidanan, Farmasi, Kendari, Publikasi Ilmiah">
		<meta property="og:title" content="Portal E-Journal STIKES Pelita Ibu">
		<meta property="og:description" content="Akses publikasi ilmiah terakreditasi dan riset kesehatan terbaru dari Sekolah Tinggi Ilmu Kesehatan Pelita Ibu.">
		<meta property="og:type" content="website">
		<meta property="og:image" content="{$baseUrl}/public/site/site_logo.png">
	{/if}

	{load_header context="frontend"}
	{load_stylesheet context="frontend"}
	<link rel="preconnect" href="https://fonts.googleapis.com">
	<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
	<link href="https://fonts.googleapis.com/css2?family=Inter:wght@300;400;500;600;700;800&family=Outfit:wght@400;700;900&display=swap" rel="stylesheet">
	<link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    
    {* Lucide Icons for Premium Look *}
    <script src="https://unpkg.com/lucide@latest"></script>
    
    {* Premium Design Stylesheet *}
    <link rel="stylesheet" href="{$baseUrl}/styles/premium.css?v={$smarty.now}">
