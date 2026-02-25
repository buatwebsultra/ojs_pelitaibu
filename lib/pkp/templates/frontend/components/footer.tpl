{**
 * templates/frontend/components/footer.tpl
 *
 * Copyright (c) 2014-2021 Simon Fraser University
 * Copyright (c) 2003-2021 John Willinsky
 * Distributed under the GNU GPL v3. For full terms see the file docs/COPYING.
 *
 * @brief Common site frontend footer.
 *
 * @uses $isFullWidth bool Should this page be displayed without sidebars? This
 *       represents a page-level override, and doesn't indicate whether or not
 *       sidebars have been configured for thesite.
 *}

	</div><!-- pkp_structure_main -->

	{* Sidebars *}
	{if empty($isFullWidth)}
		{capture assign="sidebarCode"}{call_hook name="Templates::Common::Sidebar"}{/capture}
		{if $sidebarCode}
			<div class="pkp_structure_sidebar left" role="complementary">
				{$sidebarCode}
			</div><!-- pkp_sidebar.left -->
		{/if}
	{/if}
</div><!-- pkp_structure_content -->

<div class="pkp_structure_footer_wrapper" role="contentinfo">
	<a id="pkp_content_footer"></a>

	<div class="pkp_structure_footer">

		{if $currentContext}
		{* ===== PREMIUM FOOTER FOR JOURNAL PAGES ===== *}
		<div class="premium-footer" data-aos="fade-up">
			<div class="footer-grid">
				{* Column 1: Journal Info *}
				<div class="footer-col">
					<h4><i data-lucide="book-open"></i> {$currentContext->getLocalizedName()|escape}</h4>
					<div class="footer-contact-item">
						<i data-lucide="map-pin"></i>
						<span>Published by STIKES Pelita Ibu<br>Kampus Pelita Ibu, Jl. Kampung Baru Anduonohu, Poasia, Kota Kendari</span>
					</div>
					<div class="footer-contact-item">
						<i data-lucide="mail"></i>
						<span>irmanidrus80@gmail.com</span>
					</div>
					<div class="footer-contact-item">
						<i data-lucide="phone"></i>
						<span>+62 821-8945-0827</span>
					</div>
				</div>

				{* Column 2: Quick Links *}
				<div class="footer-col">
					<h4><i data-lucide="link"></i> Quick Links</h4>
					<a href="{url page="about"}">About the Journal</a>
					<a href="{url page="about" op="editorialTeam"}">Editorial Team</a>
					<a href="{url page="about" op="submissions"}">Submissions</a>
					<a href="{url page="issue" op="archive"}">Archives</a>
					<a href="{url page="about" op="contact"}">Contact Us</a>
				</div>

				{* Column 3: Policies *}
				<div class="footer-col">
					<h4><i data-lucide="clipboard-list"></i> Policies</h4>
					<a href="{url page="about" op="submissions"}">Author Guidelines</a>
					<a href="{url page="about" op="privacy"}">Privacy Statement</a>
					<a href="{url page="PeerReviewProcess"}">Peer Review Process</a>
					<a href="{url page="OpenAccessPolicy"}">Open Access Policy</a>
					<a href="{url page="PublicationEthics"}">Publication Ethics</a>
				</div>
			</div>

			<div class="footer-bottom">
				<p>© 2026 {$currentContext->getLocalizedName()|escape}. Hak Cipta Dilindungi.</p>
				<p>Platform &amp; Workflow by <a href="{url page="about" op="aboutThisPublishingSystem"}">OJS / PKP</a></p>
			</div>
		</div>
		{* ===== END PREMIUM FOOTER ===== *}
		{else}
		{* ===== PREMIUM FOOTER FOR PORTAL LEVEL (SITE INDEX) ===== *}
		<div class="premium-footer" data-aos="fade-up">
			<div class="footer-grid">
				{* Column 1: Institutional Links (Swapped) *}
				<div class="footer-col">
					<h4><i data-lucide="graduation-cap"></i> Institutional</h4>
					<a href="https://www.pelitaibu.ac.id" target="_blank">Official Website</a>
					<a href="{url page="about" op="aboutThisPublishingSystem"}">About OJS</a>
					<a href="#">Privacy Policy</a>
				</div>

				{* Column 2: Portal Links *}
				<div class="footer-col">
					<h4><i data-lucide="external-link"></i> Portal Links</h4>
					<a href="{url page="index"}">Home Portal</a>
					<a href="{url page="about"}">About the Portal</a>
					<a href="{url page="login"}">Universal Login</a>
					<a href="{url page="user" op="register"}">Create Account</a>
				</div>

				{* Column 3: Institutional Info (Swapped & Left Aligned) *}
				<div class="footer-col">
					<h4><i data-lucide="landmark"></i> Kampus Pelita Ibu</h4>
					<div class="footer-contact-item">
						<i data-lucide="map-pin"></i>
						<span>Jl. Kampung Baru Anduonohu, Poasia, Kota Kendari, Sulawesi Tenggara</span>
					</div>
					<div class="footer-contact-item">
						<i data-lucide="mail"></i>
						<span>info@pelitaibu.ac.id</span>
					</div>
					<div class="footer-contact-item">
						<i data-lucide="phone"></i>
						<span>+62 821-8945-0827</span>
					</div>
				</div>
			</div>

			<div class="footer-bottom">
				<p>© 2026 Sekolah Tinggi Ilmu Kesehatan Pelita Ibu. Hak Cipta Dilindungi.</p>
				<p>Platform &amp; Workflow by <a href="{url page="about" op="aboutThisPublishingSystem"}">OJS / PKP</a></p>
			</div>
		</div>
		{* ===== END PREMIUM FOOTER ===== *}
		{/if}
	</div>
</div><!-- pkp_structure_footer_wrapper -->

</div><!-- pkp_structure_page -->

{load_script context="frontend"}

<script src="https://unpkg.com/aos@next/dist/aos.js"></script>
<script>
    AOS.init({
        duration: 1000,
        once: true,
        offset: 100
    });
    
    // Initialize Lucide Icons
    if (typeof lucide !== 'undefined') {
        lucide.createIcons();
    }
</script>

{call_hook name="Templates::Common::Footer::PageFooter"}
</body>
</html>

