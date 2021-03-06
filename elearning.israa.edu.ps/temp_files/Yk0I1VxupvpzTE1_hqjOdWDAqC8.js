; window.CloudflareApps = window.Eager = window.CloudflareApps || window.Eager || {}; window.CloudflareApps = window.CloudflareApps || {}; CloudflareApps.siteId = "4571ebe3d67de89e82a19cdd0b816f91"; CloudflareApps.installs = CloudflareApps.installs || {};; (function () {
    CloudflareApps.internal = CloudflareApps.internal || {}; var errors = []; CloudflareApps.internal.placementErrors = errors; var errorHashes = {}
    var noteError = function (options) {
        var hash = options.selector + '::' + options.type + '::' + (options.installId || ''); if (errorHashes[hash])
            return; errorHashes[hash] = true; errors.push(options);
    }
    var initializedSelectors = {}; var currentInit = false; CloudflareApps.internal.markSelectors = function () { if (!currentInit) { check(); currentInit = true; setTimeout(function () { currentInit = false; }); } }
    var check = function () {
        var installs = window.CloudflareApps.installs; for (var installId in installs) {
            if (!installs.hasOwnProperty(installId))
                continue; var selectors = installs[installId].selectors; if (!selectors)
                    continue; for (var key in selectors) {
                        if (!selectors.hasOwnProperty(key))
                            continue; var hash = installId + "::" + key; if (initializedSelectors[hash])
                                continue; var els = document.querySelectorAll(selectors[key]); if (els && els.length > 1) { noteError({ type: 'init:too-many', option: key, selector: selectors[key], installId: installId }); initializedSelectors[hash] = true; continue; } else if (!els || !els.length) { continue; }
                        initializedSelectors[hash] = true; els[0].setAttribute('cfapps-selector', selectors[key]);
                    }
        }
    }
    CloudflareApps.querySelector = function (selector) {
        if (selector === 'body' || selector === 'head') { return document[selector]; }
        CloudflareApps.internal.markSelectors(); var els = document.querySelectorAll('[cfapps-selector="' + selector + '"]'); if (!els || !els.length) {
            noteError({ type: 'select:not-found:by-attribute', selector: selector }); els = document.querySelectorAll(selector); if (!els || !els.length) { noteError({ type: 'select:not-found:by-query', selector: selector }); return null; } else if (els.length > 1) { noteError({ type: 'select:too-many:by-query', selector: selector }); }
            return els[0];
        }
        if (els.length > 1) { noteError({ type: 'select:too-many:by-attribute', selector: selector }); }
        return els[0];
    }
})();; (function () {
    var prevEls = {}; CloudflareApps.createElement = function (options, prevEl) {
        CloudflareApps.internal.markSelectors(); try {
            if (prevEl && prevEl.parentNode) {
                var replacedEl; if (prevEl.cfAppsElementId) { replacedEl = prevEls[prevEl.cfAppsElementId]; }
                if (replacedEl) { prevEl.parentNode.replaceChild(replacedEl, prevEl); delete prevEls[prevEl.cfAppsElementId]; } else { prevEl.parentNode.removeChild(prevEl); }
            }
            var element = document.createElement('cloudflare-app'); var container; try { container = CloudflareApps.querySelector(options.selector); } catch (e) { }
            if (!container) { return element; }
            if (!container.parentNode && (options.method == "after" || options.method == "before" || options.method == "replace")) { return element; }
            if (container == document.body) {
                if (options.method == "after")
                    options.method = "append"; else if (options.method == "before")
                        options.method = "prepend";
            }
            switch (options.method) {
                case "prepend": if (container.firstChild) { container.insertBefore(element, container.firstChild); break; }
                case "append": container.appendChild(element); break; case "after": if (container.nextSibling) { container.parentNode.insertBefore(element, container.nextSibling); } else { container.parentNode.appendChild(element); }
                    break; case "before": container.parentNode.insertBefore(element, container); break; case "replace": try { id = element.cfAppsElementId = Math.random().toString(36); prevEls[id] = container; } catch (e) { }
                        container.parentNode.replaceChild(element, container);
            }
            return element;
        } catch (e) { if (typeof console !== "undefined" && typeof console.error !== "undefined") { console.error("Error creating Cloudflare Apps element", e); } }
    }
})();; (function () {
    CloudflareApps.matchPage = function (patterns) {
        if (!patterns || !patterns.length) { return true; }
        if (window.CloudflareApps && CloudflareApps.proxy && CloudflareApps.proxy.originalURL) { var url = CloudflareApps.proxy.originalURL.parsed; var loc = url.host + url.path; } else { var loc = document.location.host + document.location.pathname; }
        for (var i = 0; i < patterns.length; i++) { var re = new RegExp(patterns[i], 'i'); if (re.test(loc)) { return true; } }
        return false;
    }
})();; CloudflareApps.installs["e5vq1GsMl0jA"] = { appId: "kT4AKs7IySDL", scope: {} };; CloudflareApps.installs["e5vq1GsMl0jA"].options = { "account": { "accountId": "Ny1FhNptwymh", "service": "clicky" }, "site": "100953807" };; CloudflareApps.installs["e5vq1GsMl0jA"].URLPatterns = ["^ac-courses.qou.edu/?.*$", "^acadws.qou.edu/?.*$", "^adminportal.qou.edu/?.*$", "^adminws.qou.edu/?.*$", "^alumni.qou.edu/?.*$", "^avicourse.qou.edu/?.*$", "^berc.qou.edu/?.*$", "^cec.qou.edu/?.*$", "^diploma.qou.edu/?.*$", "^dspace.qou.edu/?.*$", "^dvr.qou.edu/?.*$", "^ecourse.qou.edu/?.*$", "^elearning.qou.edu/?.*$", "^etraining.qou.edu/?.*$", "^evl.qou.edu/?.*$", "^gts.qou.edu/?.*$", "^ictday.qou.edu/?.*$", "^journals.qou.edu/?.*$", "^library.qou.edu/?.*$", "^libtest.qou.edu/?.*$", "^mlearning.qou.edu/?.*$", "^ooc.qou.edu/?.*$", "^portal.qou.edu/?.*$", "^precourse.qou.edu/?.*$", "^ptpd.qou.edu/?.*$", "^qtube.qou.edu/?.*$", "^research.qou.edu/?.*$", "^rufo.qou.edu/?.*$", "^slideshare.qou.edu/?.*$", "^survey.qou.edu/?.*$", "^tadreeb.qou.edu/?.*$", "^test.qou.edu/?.*$", "^webmail.qou.edu/?.*$", "^wies.qou.edu/?.*$", "^www.qou.edu/?.*$"];; CloudflareApps.installs["e5vq1GsMl0jA"].product = { "id": "free" };; if (CloudflareApps.matchPage(CloudflareApps.installs['e5vq1GsMl0jA'].URLPatterns)) {
    (function () {
        'use strict'; let a = window; let b = document; var options = CloudflareApps.installs['e5vq1GsMl0jA'].options; if (!options.site) { return; }
        var createAndAddClicky = function () { var elementToAppendTo = b.getElementsByTagName('head')[0] || b.getElementsByTagName('body')[0]; a.clicky_site_ids = a.clicky_site_ids || []; a.clicky_site_ids.push(options.site); var s = b.createElement('script'); s.type = 'text/javascript'; s.async = true; s.src = 'https://static.getclicky.com/js'; elementToAppendTo.appendChild(s); }
        createAndAddClicky();
    }())
}