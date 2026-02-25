// JPASAIK Custom Header Injection Script
(function () {
    console.log("JPASAIK Header Script Loading...");

    function injectHeader() {
        // Hide old header
        var oldSiteName = document.querySelector(".pkp_site_name");
        if (oldSiteName) {
            oldSiteName.style.display = "none";
        }

        // Create ISSN Bar
        var issnBar = document.createElement("div");
        issnBar.className = "issn-top-bar";
        issnBar.innerHTML = '<div class="issn-container">' +
            '<div><span class="issn-label">Print ISSN:</span> <span class="issn-value">2527-7391</span></div>' +
            '<div><span class="issn-label">Online ISSN:</span> <span class="issn-value">2527-9076</span></div>' +
            '</div>';

        // Create Premium Header
        var premiumHeader = document.createElement("div");
        premiumHeader.className = "premium-header";
        premiumHeader.innerHTML = '<div class="header-inner">' +
            '<div class="header-logo-section"><img src="https://ojs.pelitaibu.ac.id/public/journals/1/pageHeaderLogoImage_en.png" alt="JPASAIK Logo"></div>' +
            '<div class="header-title-section">' +
            '<h1>JPASAIK</h1>' +
            '<div class="journal-subtitle">Jurnal Pelita Sains Kesehatan</div>' +
            '<div class="journal-publisher">Published by STIKES Pelita Ibu</div>' +
            '</div></div>';

        // Insert into page
        var headWrapper = document.querySelector(".pkp_head_wrapper");
        if (headWrapper) {
            headWrapper.insertBefore(issnBar, headWrapper.firstChild);
            headWrapper.insertBefore(premiumHeader, issnBar.nextSibling);
            console.log("JPASAIK Custom Header Injected Successfully!");
        } else {
            console.error("Could not find .pkp_head_wrapper");
        }
    }

    // Run when DOM is ready
    if (document.readyState === "loading") {
        document.addEventListener("DOMContentLoaded", injectHeader);
    } else {
        injectHeader();
    }
})();
