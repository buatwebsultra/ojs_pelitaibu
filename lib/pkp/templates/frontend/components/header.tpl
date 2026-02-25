{**
 * lib/pkp/templates/frontend/components/header.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common frontend site header.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}
{strip}
	{* Determine whether a logo or title string is being displayed *}
	{assign var="showingLogo" value=true}
	{if !$displayPageHeaderLogo}
		{assign var="showingLogo" value=false}
{/if}
<!DOCTYPE html>
<html lang="{$currentLocale|replace:"_":"-"}" xml:lang="{$currentLocale|replace:"_":"-"}">
{if !$pageTitleTranslated}{capture assign="pageTitleTranslated"}{translate key=$pageTitle}{/capture}{/if}
{include file="frontend/components/headerHead.tpl"}
<body class="pkp_page_{$requestedPage|escape|default:"index"} pkp_op_{$requestedOp|escape|default:"index"}{if $showingLogo} has_site_logo{/if}{if $currentContext} is_journal{else} is_site{/if}" dir="{$currentLocaleLangDir|escape|default:"ltr"}">

	<div class="pkp_structure_page">
		{* Header *}
		<header class="pkp_structure_head" id="headerNavigationContainer" role="banner">
			<div class="pkp_head_wrapper">
				<div class="pkp_site_name">
				{capture assign="homeUrl"}
					{url page="index" router=\PKP\core\PKPApplication::ROUTE_PAGE}
				{/capture}
				{if $displayPageHeaderLogo}
					<a href="{$homeUrl}" class="is_img">
						<img src="{$publicFilesDir}/{$displayPageHeaderLogo.uploadName|escape:"url"}" {if $displayPageHeaderLogo.width && $displayPageHeaderLogo.width > 0}width="{$displayPageHeaderLogo.width|escape}"{/if} height="{$displayPageHeaderLogo.height|escape}" {if $displayPageHeaderLogo.altText != ''}alt="{$displayPageHeaderLogo.altText|escape}"{/if} class="header_banner_img" />
						{if !$currentContext}
							<span class="pkp_site_name_wrapper">
								<span class="pkp_site_subtitle">Open Journal System</span>
								<span class="pkp_site_title">STIKES Pelita Ibu</span>
							</span>
						{/if}
					</a>
				{elseif $displayPageHeaderTitle}
					<a href="{$homeUrl}" class="is_text">{$displayPageHeaderTitle|escape}</a>
				{else}
					<a href="{$homeUrl}" class="is_img">
						<img src="{$baseUrl}/templates/images/structure/logo.png" alt="{$applicationName|escape}" title="{$applicationName|escape}" width="180" height="90" />
						{if !$currentContext}
							<span class="pkp_site_name_text">Open Journal System, STIKES Pelita Ibu</span>
						{/if}
					</a>
				{/if}
				</div>
			</div>


		{* Navigation bar below the banner *}
		{if $currentContext}
		<div class="pkp_site_nav_menu" aria-label="Site Navigation">
			<nav role="navigation">
				<div class="pkp_navigation_primary_row">
					{load_menu name="primary" id="navigationPrimary" ulClass="pkp_nav_list pkp_nav_primary" liClass=""}
				</div>
			</nav>
		</div>
		{/if}

		</header><!-- .pkp_structure_head -->

	{* --- PREMIUM HERO INJECTION (FOR ALL JOURNAL HOMEPAGES) --- *}
	{if ($requestedPage == 'index' || !$requestedPage) && $requestedOp == 'index' && $currentContext}
		<section class="premium-hero">
			<div class="hero-overlay"></div>
			<div class="hero-content" data-aos="fade-up">
				<div class="hero-badge"><i data-lucide="award" style="width:14px;height:14px;"></i> Peer-Reviewed · Open Access</div>
				<h1 class="hero-title">{$currentContext->getLocalizedName()|escape}</h1>
				{if $currentContext->getLocalizedDescription()}
					<p class="hero-subtitle">{$currentContext->getLocalizedDescription()|strip_tags|truncate:400:"..."}</p>
				{else}
					<p class="hero-subtitle">Pusat Publikasi Ilmiah dan Riset Terintegrasi di bawah STIKES Pelita Ibu. Berfokus pada pengembangan ilmu kesehatan secara kolektif dan profesional.</p>
				{/if}
				<div class="hero-buttons">
					<a href="{url page="about" op="submissions"}" class="hero-btn hero-btn-primary">
						<i data-lucide="send"></i> Submit Article
					</a>
					<a href="{url page="issue" op="archive"}" class="hero-btn hero-btn-secondary">
						<i data-lucide="library"></i> Browse Archives
					</a>
				</div>
				<div class="hero-stats" data-aos="fade-up" data-aos-delay="200">
					<div class="hero-stat-item">
						<span class="hero-stat-number">150+</span>
						<span class="hero-stat-label">Artikel Terbit</span>
					</div>
					<div class="hero-stat-divider"></div>
					<div class="hero-stat-item">
						<span class="hero-stat-number">12</span>
						<span class="hero-stat-label">Volume</span>
					</div>
					<div class="hero-stat-divider"></div>
					<div class="hero-stat-item">
						<span class="hero-stat-number">500+</span>
						<span class="hero-stat-label">Penulis</span>
					</div>
				</div>
				<div class="social-links" data-aos="fade-up" data-aos-delay="300">
					<a href="#" class="social-icon" title="Instagram"><i data-lucide="instagram"></i></a>
					<a href="#" class="social-icon" title="Twitter/X"><i data-lucide="twitter"></i></a>
					<a href="#" class="social-icon" title="LinkedIn"><i data-lucide="linkedin"></i></a>
				</div>
			</div>
			<div class="hero-wave">
				<svg viewBox="0 0 1440 100" preserveAspectRatio="none">
					<path d="M0,40 C360,100 1080,0 1440,60 L1440,100 L0,100 Z" fill="#f8fafc"/>
				</svg>
			</div>
		</section>

		{* Metrics Section for Homepage *}
		<div class="premium-metrics-wrapper" style="max-width: 1200px; margin: 0 auto; padding: 0 20px;">
			<div class="premium-metrics" data-aos="fade-up" style="margin-top: -50px; position: relative; z-index: 15; display: flex; gap: 20px; justify-content: center;">
				<div class="metric-card" style="background:#fff; padding: 25px; border-radius: 15px; box-shadow: var(--shadow-lg); text-align: center; flex: 1; max-width: 250px;">
                    <i data-lucide="zap" style="color:var(--accent-color); margin-bottom: 10px;"></i>
					<div class="metric-value" style="font-weight: 800; font-size: 20px; display:block;">Fast Track</div>
					<div class="metric-label" style="font-size: 12px; color: var(--text-muted);">Publication</div>
				</div>
				<div class="metric-card" style="background:#fff; padding: 25px; border-radius: 15px; box-shadow: var(--shadow-lg); text-align: center; flex: 1; max-width: 250px;">
                    <i data-lucide="unlock" style="color:var(--accent-color); margin-bottom: 10px;"></i>
					<div class="metric-value" style="font-weight: 800; font-size: 20px; display:block;">Open</div>
					<div class="metric-label" style="font-size: 12px; color: var(--text-muted);">Access Policy</div>
				</div>
				<div class="metric-card" style="background:#fff; padding: 25px; border-radius: 15px; box-shadow: var(--shadow-lg); text-align: center; flex: 1; max-width: 250px;">
                    <i data-lucide="check-circle" style="color:var(--accent-color); margin-bottom: 10px;"></i>
					<div class="metric-value" style="font-weight: 800; font-size: 20px; display:block;">Peer</div>
					<div class="metric-label" style="font-size: 12px; color: var(--text-muted);">Reviewed</div>
				</div>
			</div>
		</div>
	{/if}

    <script>
        lucide.createIcons();
    </script>

		{* Wrapper for page content and sidebars *}
		{if $isFullWidth}
			{assign var=hasSidebar value=0}
		{/if}
		<div class="pkp_structure_content{if $hasSidebar} has_sidebar{/if}">
			<div class="pkp_structure_main" role="main">
				<a id="pkp_content_main"></a>
