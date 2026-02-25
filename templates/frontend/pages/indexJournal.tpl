{**
 * templates/frontend/pages/indexJournal.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Display the index page for a journal
 *
 * @uses $currentJournal Journal This journal
 * @uses $journalDescription string Journal description from HTML text editor
 * @uses $homepageImage object Image to be displayed on the homepage
 * @uses $additionalHomeContent string Arbitrary input from HTML text editor
 * @uses $announcements array List of announcements
 * @uses $numAnnouncementsHomepage int Number of announcements to display on the
 *       homepage
 * @uses $issue Issue Current issue
 *}
{include file="frontend/components/header.tpl" pageTitleTranslated=$currentJournal->getLocalizedName()}

<div class="page page_index_journal">



	{call_hook name="Templates::Index::journal"}

	{include file="frontend/objects/announcements_list.tpl" numAnnouncements=$numAnnouncementsHomepage}

	{* Latest issue *}
	{if $issue}
		<section class="current_issue" data-aos="fade-up">
			<div class="section_header">
				<h2 style="font-family:'Outfit',sans-serif;">
					<i data-lucide="book-open" style="vertical-align: middle; margin-right: 10px; color: var(--accent-color);"></i>
					{translate key="journal.currentIssue"}
				</h2>
				<div class="current_issue_title" style="font-size: 24px; font-weight: 800; color: var(--primary-color); margin-bottom: 30px;">
					{$issue->getIssueIdentification()|strip_unsafe_html}
				</div>
				<div class="section_divider" style="margin: 0 auto 40px auto;"></div>
			</div>
			
			<div class="issue_toc_wrapper" style="background: #fff; border-radius: 20px; padding: 40px; box-shadow: var(--shadow-md); border: 1px solid var(--border-color);">
				{include file="frontend/objects/issue_toc.tpl" heading="h3"}
			</div>
			
			<div style="text-align: center; margin-top: 40px;">
				<a href="{url page="issue" op="archive"}" class="hero-btn hero-btn-secondary" style="display: inline-flex; color: var(--primary-color); border-color: var(--primary-color);">
					<i data-lucide="archive"></i> {translate key="journal.viewAllIssues"}
				</a>
			</div>
		</section>
	{/if}

	{* Additional Homepage Content *}
	{if $additionalHomeContent}
		<div class="additional_content">
			{$additionalHomeContent}
		</div>
	{/if}
</div><!-- .page -->

{include file="frontend/components/footer.tpl"}
