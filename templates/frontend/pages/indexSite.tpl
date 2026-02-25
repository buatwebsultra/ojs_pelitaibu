{**
 * templates/frontend/pages/indexSite.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * Site index.
 *
 *}
{include file="frontend/components/header.tpl"}

<div class="page_index_site">

	{if $about}
		<div class="about_site">
			<div class="about_site_content">
				{$about}
			</div>
		</div>
	{/if}

	{include file="frontend/objects/announcements_list.tpl" numAnnouncements=$numAnnouncementsHomepage}

	{* Site Hero Section *}
	<section class="premium-hero" data-aos="fade-in">
		<div class="hero-overlay"></div>
		<div class="hero-content" data-aos="zoom-out-up">
			<div class="hero-badge"><i data-lucide="shield-check" style="width:14px;height:14px;"></i> Official Portal E-Journal</div>
			<h1 class="hero-title" style="font-family:'Outfit',sans-serif;">STIKES Pelita Ibu</h1>
			<p class="hero-subtitle">Pusat Publikasi Ilmiah dan Riset Kesehatan Terintegrasi (Kebidanan, Farmasi, Administrasi Rumah Sakit)</p>
			
			<div class="hero-stats">
				<div class="mini-stat">
                    <i data-lucide="check-circle" style="color:var(--accent-color); margin-bottom: 5px;"></i>
					<span class="val">2</span>
					<span class="lab">Jurnal Aktif</span>
				</div>
				<div class="mini-stat">
                    <i data-lucide="file-text" style="color:var(--accent-color); margin-bottom: 5px;"></i>
					<span class="val">250+</span>
					<span class="lab">Artikel Terbit</span>
				</div>
				<div class="mini-stat">
                    <i data-lucide="users" style="color:var(--accent-color); margin-bottom: 5px;"></i>
					<span class="val">1K+</span>
					<span class="lab">Penulis & Peneliti</span>
				</div>
			</div>
		</div>
		<div class="hero-wave">
			<svg viewBox="0 0 1440 100" preserveAspectRatio="none">
				<path d="M0,40 C360,100 1080,0 1440,60 L1440,100 L0,100 Z" fill="#f8fafc"/>
			</svg>
		</div>
	</section>

	{* Portal Intro Section *}
	<div class="portal_intro" data-aos="fade-up">
		Jurnal Pelita Sains Kesehatan , is a national journal and is published four times a year. Journal of Health Sciences Pelita is published online by STIKes Pelita Ibu, Address : UPPM Building STIKes
	</div>

	<div class="journals">
		<div class="section_header">
			<h2 style="font-family:'Outfit',sans-serif;">{translate key="context.contexts"}</h2>
			<div class="section_divider"></div>
		</div>

		{if !$journals|@count}
			<div class="no_journals_msg">
				{translate key="site.noJournals"}
			</div>
		{else}
			<ul class="journal_grid">
				{foreach from=$journals item=journal}
					{capture assign="url"}{url journal=$journal->getPath()}{/capture}
					{assign var="thumb" value=$journal->getLocalizedData('journalThumbnail')}
					{assign var="description" value=$journal->getLocalizedDescription()}
					<li class="journal_card" data-aos="fade-up">
						<div class="thumb{if !$thumb} no_img{/if}">
							<a href="{$url}">
								<div class="thumb_overlay"></div>
								{if $thumb}
									<img src="{$journalFilesPath}{$journal->getId()}/{$thumb.uploadName|escape:"url"}"{if $thumb.altText} alt="{$thumb.altText|escape|default:''}"{/if}>
								{else}
									<div class="placeholder_icon">
										<div class="inner_placeholder">
											<span class="letter">{$journal->getLocalizedName()|substr:0:1|upper}</span>
											<span class="bg_letter">{$journal->getLocalizedName()|substr:0:1|upper}</span>
										</div>
									</div>
								{/if}
							</a>
						</div>

						<div class="body">
							<h3 style="font-family:'Outfit',sans-serif;">
								<a href="{$url}" rel="bookmark">
									{$journal->getLocalizedName()|escape}
								</a>
							</h3>
							{if $description}
								<div class="description" style="height: 100px; overflow: hidden; display: -webkit-box; -webkit-line-clamp: 4; -webkit-box-orient: vertical;">
									{$description|strip_tags}
								</div>
							{/if}
							<div class="footer_links">
								<a href="{$url}" class="btn_primary">
									<i data-lucide="eye" style="width:16px;"></i> View Journal
								</a>
								<a href="{url journal=$journal->getPath() page="issue" op="current"}" class="btn_secondary">
									<i data-lucide="trending-up" style="width:16px;"></i> Current Issue
								</a>
								<div class="footer_links_sub">
									<a href="{url journal=$journal->getPath() page="login"}" class="btn_login">
										Login
									</a>
									<a href="{url journal=$journal->getPath() page="user" op="register"}" class="btn_register">
										Register
									</a>
								</div>
							</div>
						</div>
					</li>
				{/foreach}
			</ul>
		{/if}
	</div>

</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
