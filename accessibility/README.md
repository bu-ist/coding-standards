# Accessibility

Website ADA compliance refers to the practice of making a website accessible to people with disabilities. It’s not optional. It’s the law. The Americans with Disabilities Act (ADA) that mandates the inclusion of all people, especially those with disabilities, in all areas of public life.

**Accessible design means better design.**

Under the University’s Website Policy (the “Policy”), all new and redesigned University Websites and Web-enabled content published after the Policy’s Effective Date must comply with these [Minimum Web Accessibility Standards (MWAS)](https://www.bu.edu/mwas/). The MWAS articulate the minimum technical and visual requirements needed to comply with the Policy’s accessibility requirements for University Websites and Web-enabled content.

## WordPress Accessibility Coding Standards

The [WordPress Accessibility Coding Standards](https://developer.wordpress.org/coding-standards/wordpress-coding-standards/accessibility/) states that code is expected to conform to the [Web Content Accessibility Guidelines (WCAG)](https://www.w3.org/WAI/standards-guidelines/wcag/), version 2.2, at level AA. It is also encouraged to incorporate the [Authoring Tool Accessibility Guidelines (ATAG) 2.0](https://www.w3.org/WAI/standards-guidelines/atag/). This is currently (2025) a stricter standard than BU's MWAS.

### Gutenberg Starter Repos

Unlike PHP/CSS/JS there are no command line tools packaged with this repo to run accessibily checks. This is best done in the browser on the client-rendered code.

### Older Repos

See above: Gutenberg Starter Repos.

## Testing

BU uses [SiteImprove](https://alfa.siteimprove.com/rules) to monitoring and report on many, but not all, of our BU websites. Site admins have access to review reporting on their website. This effort is lead by IS&T, and reported on annual to the Common Services & Information Security Governance Committee.

- [Wave](https://wave.webaim.org/extension/) can be accessed directly within the WP editor on pages and posts. Both Plugin and WP editor both test at 2.2, which is over the minimum for MWAS
- The [axe DevTools Plugin](https://www.deque.com/axe/browser-extensions/) will allow us to test at 2.1 and up in some cases
- The [Adobe Color web app](https://color.adobe.com) allows for color contrast checking. Designs must meet AA targets.
- Don’t forget to just tab through the site manually with your keyboard!

**Why not use the SiteImprove extension?** WAVE is provided in the editor for site admins to use already so it makes it consistent for them. If and when SiteImprove is made available for all sites we will consider a switch and possibly within the editor as well.

We should be using this [repo](https://github.com/orgs/bu-ist/projects/53/views/1) to track any accessibility issues we run into with projects / products in production. If something comes up in a project during dev it should go directly into that projects repo as an issue.

### IDEs

Again, there are tools that may catch basic issues like missing alt tags, but testing with the final rendered page is always best.

### Client Training

- Pre-Launch: ID should help clients review and improve when building new sites. This may include some additional training during project releases.
- Post-Launch: Client is notified of an issue, we can help them or point in in right direction.

## Refactoring

We all know that we have a large portfolio of client sites, built on custom themes that we have made over the years.  Here are some basic guidelines should we run into any issues:

- Product issues will not be corrected within specific themes or if reported in relation to a specific site.
- ID can and should help clients to understand content issues and how it might be fixed, we can point them to resources if needed.
- IS&T will also help as issues are reported to them that they may be able to quickly update.

We also have a large collection of products such as plugins, parent themes, etc. that we use in our environment. Here are some basic guidelines should we run into any issues:

- Issues found in sites, related to products, should be carefully documented and then set aside from any testing and reviews.
- Product issues will be triaged and addressed as determined by the product team in conjunction with the ADA Specialists.
- There is no issue with launching sites that include known product issues to production.

[When in doubt, be sure to ask.](https://buweb.slack.com/archives/C7H9HMSG2)

### IS&T

Issues found by [IS&T during the launch](https://www.bu.edu/tech/services/cccs/websites/www/wordpress/how-to/staging-sites/#:~:text=index%20your%20content.-,Launch%20Requests,-Please%20allow%20adequate) of a new or updated site generally fall into 3 categories:

- Content issues: if possible we can help the client to understand the problem(s) and how it might be fixed, this can be done in production if necessary
- Theme issues: we accidentally added something that was not up to snuff, these need to be fixed
- Product issues: while very important, they will not hold up the launch of a site…these are known and will be corrected beyond any specific project schedule (unless determined first)

Please note: that down the road launching sites with issues WILL be stopped, but this will not start to take place until all of the products can be updated and underlying problems resolved. Please work with your AE, PM, or Jon B if there are any questions or issues.
