# IMPORTANT

This is a working draft of the coding standards updates. **DO NOT USE IT YET.**

# Coding in the spirit of our standards

We believe that code should be predictable, easy to maintain, and easy to understand. While our standards are intended to help support these ideas, we recognize that no two designers or developers will come up with the exact same solution to the same problem. We want you to code in the spirit of the law as much as follow letter of the law. And if you find any rules that go against what we're trying to accomplish, don't be afraid to challenge them [here](https://github.com/bu-ist/coding-standards/issues) and start a discussion so we can improve them.

### Code should be predictable.

Your project works alongside a complex ecosystem of plugins, frameworks, and content. In order to be able to update these things in a timely manner, everyone's code has to behave predictably and reliably. We do this by:

* [Naming everything consistently](#semantics) (Needs review)
* [Prohibiting overly specific rules](#specificity) (SASS nesting rules should reference this)
* Prohibiting overrides on certain classes (NEW ADDITION - restrict grid and utility classes)

### Code should be easy to maintain.

Themes, frameworks, and plugins are often used years into the future and pass through many hands. These items - nitpicky as they seem - help make it easy for us to share and transition projects from person to person. We accomplish this by:

* [Formatting our code consistently](#formatting) (SASS linter should be able to take care of this)
* Using the mixins and placeholder classes provided by the framework before you write custom code (NEW ADDITION FOR SASS - do not rewrite things that are already built into the framework)
* Structuring our SASS files consistently (NEW ADDITION FOR SASS - explains how to override, include/exclude, organize, and name partials, and how to deal with overriding or excluding Responsive Framework partials - we should also add this to the child starter)

### Code should be easy to understand.

When someone else looks at your code, it should be easy to understand how an element will behave and why. We also know that we can't predict every situation, and there is going to be a time where you need to break the rules. We deal with this by:

* Using `@extend` when an element needs to use grid classes or icons (NEW ADDITION FOR SASS)
* Nesting pseudo-elements and states (NEW ADDITION FOR SASS)
* Nesting media queries, feature detection, and browser-specific styles under the class they affect (NEW ADDITION FOR SASS)
* Explaining any rules we break and why with a single line comment `//` (NEW ADDITION FOR SASS - consider using a keyword)
* Using multi-line (`/* */`) comments for information that helps debug the compiled CSS, such as noting the location of a SASS placeholder class

With that said, use the rules below to guide your code towards those principles.

# CSS & SASS Standards

**Table of contents**

* [General Formatting](#formatting)
* [Declaration Order](#declaration-order)
* [Comments](#comments)
* [Vendor Prefixes](#vendor-prefixes)
* [Sass](#sass)
* [Naming Conventions](#naming-conventions)
	* [Summary of Semantics](#semantics)
	* [IDs & Classes](#ids-and-classes)
	* [Specificity](#specificity)
	* [JavaScript](#javascript)
	* [Utilities](#utilities)
	* [Components](#components)
	* [Images](#images)
* [Variables](#variables)
	* [colors](#colors)
	* [z-index](#zindex)
	* [fonts](#fonts)
* [Mixins](#mixins)
	* [Media Queries](#media-queries)
* [Sources](#sources)

<a name="principles"></a>
## Principles

These guidelines encourage the use of sensible patterns that model the best of what's out there. The goal is to write clean, performant, reusable styles that all our designers and developers can read and understand. We leverage Sass to help us accomplish this.

We feel strongly that information should be accessible to all, and as such, our standards encourage practices that keep accessibility and user choice in mind. For example, if a user turns JavaScript off, or the scripts fail, it's important to us that the meaning is still conveyed.

In the spirit of keeping information accessible to all, we also recognize that not everyone has access to the same level of technology and hardware. We strive to write performant HTML and CSS so information isn't gated to those who have fast internet connections. We write modern code where possible, but if a modern approach prevents access to critical information or presents a significant usability concern, it's not ready for us to adopt that approach without appropriate fallbacks in place.

These rules are in place because we believe in these things, as well as creating an environment where everyone can contribute to and understand our codebase.

<a name="formatting"></a>
## General Formatting

* Use new lines for each selector, declaration, and closing `}` <br>*(ProTip: configure your editor to "show invisibles" or to automatically remove end-of-line whitespace.)*
* Set indentation to **tabs**, not spaces. <br>*(ProTip: some editors like Sublime will let you set your preferred tab width for code viewing.)*
* Selectors are **flush left** except those nested within media queries or pseudo-elements
* Use one level of indentation for each declaration
* Include a single space before a `{`, after a `:`, and after each `,` in comma-separated properties and values
* Use double quotes consistently: `content: " "`
* Quote attribute values in selectors: `input[type="checkbox"]`
* URLs must be in double quotes: `background-image: url("images/bun.jpg");`
* Avoid specifying units for zero-values: `margin: 0;`
* Where possible, use descriptive values over numeric: `border: none;`
* Place the closing `}` of a ruleset in the same column as the first character of the ruleset
* Include a blank line before and after sections but not between rulesets

##### Example:

```css
.selector-one,
.selector-two {
	position: absolute;
	top: 0;
}
.selector-three {
	color: #ccc;
	margin: 0;
}
```

<a name="declaration-order"></a>
## Declaration Order

Declarations go in alphabetical order.

##### Example:

```css
.selector {
	bottom: 0;
	left: 0;
	position: absolute;
	right: 0;
	top: 0;
	z-index: 10;
}
```

<a name="comments"></a>
## Comments

Well commented code is extremely important. Take time to describe components, how they work, their limitations, and the way they are constructed.

* Place comments on a new line above subject.
* Make liberal use of comments to break CSS code into discrete sections.
* Use `/* */` CSS comments when you are documenting CSS, such as section labels. <br>*(ProTip: Grunt should be configured to remove all comments from its compressed output, which is best for performance, but retaining CSS comments in a secondary, uncompressed  file can be a helpful way to view and refine your Sass-ing.)*
* Use `//` Sass comments when you are documenting Sass, such as mixins.
* Add `TODO` comments detailing unfinished tasks.

##### Example:

```css
/* This is a section of related styles
----------------------------------------------------------------- */

/* This is a sub-section or basic comment */

/*
The long description is ideal for more detailed explanations and
documentation. It can include example HTML, URLs, or any other
information that is deemed necessary or useful.

TODO: This is a todo statement that describes an atomic task to be
completed at a later date. It wraps after 80 characters and following
lines are indented by 2 spaces.
*/
```

[ASCII text](http://patorjk.com/software/taag/#p=display&f=Big&t=Code%20Standards) is OK for section level comments. It's fun and useful in some editors.

<a name="sass"></a>
## Sass

* Do not include underscores or file extensions when importing SASS partials `@import "burf-theme";`
* Always place `@extend` statements before anything else in a declaration block.
* Group `@include` statements at the top of a declaration block after any `@extend` statements except for `@include breakpoint`, which you should put after your base (mobile) styles.
* Don't nest declaration blocks. It makes code hard to read on complex projects and often results unnecessarily specific selectors.
* Nesting [psuedo-classes](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes) and media queries is OK. They should be last in the declaration block, separated from other properties with an empty new line.
* Braces should follow the [1TBS style variant](https://en.wikipedia.org/wiki/Indent_style#Variant:_1TBS). Braces on a single line are not allowed.
* Always use an empty line between blocks of code.
* Child and element classes in selectors must be nested
* Nesting may not go more than three levels deep.

##### Example:

```css
.selector {
		@extend %someRule;
		@include cleafix();
		@include boxSizing(border-box);
		width: gridUnit(1);

		&:last-child {
			...
		}

		@media only screen and (min-width : 320px) {
			...
		}

		// Same as .selector .child when compiled
		.child {

			&:before {
				// This is the absolute maximum amount of nesting that is allowed
			}
		}
}
```

### Mixins

* If a mixin does not accept any arguments, do not use parentheses in the mixin declaration, and do not call the mixin with parentheses. Example: `@include vertical-center-child`

<a name="vendor-prefixes"></a>
## Vendor Prefixes

Use Sass mixins whenever possible. When writing CSS, use indentation to align values.

The following mixins are supported in Responsive Foundation so you don't have to manually write out vendor prefixes:

```
@include border-radius( 50% );
@include box-shadow( inset 0 2px 0px rgba( 255, 255, 255, 0.25 ) );
@include linear-gradient( transparent, darken( $your-color, 10% ) );
@include opacity( 0.5 );
@include transition( opacity 250ms ease-in-out 0s );
@include transform( translateX( 100px ) );
@include transform-origin( top );
@include translate( -10px, 0 );
@include rotate( 90 );
@include scale( 2 );

@include keyframes( infinite-loader ) {
	from {
		transform: rotate( 0deg );
	}
	to {
		transform: rotate( 360deg );
	}
}
@include animation( infinite-loader 250ms infinite );

```

##### Example:

```css
.selector {
		-webkit-transition: background-color 500ms ease-out 1s;
			 -moz-transition: background-color 500ms ease-out 1s;
				 -o-transition: background-color 500ms ease-out 1s;
						transition: background-color 500ms ease-out 1s;
}
```

<a name="naming-conventions"></a>
## Naming Conventions

<a name="semantics">
### Summary of Semantics

* **Javascript:** Use the `js-` prefix for classes and IDs that are used as JavaScript selectors.
* **Utilities:** Use the `u-` prefix for single purpose utility classes like `.u-hide` and `.u-show`.
* **Naming:** Scope your classes by naming them with a component-descendant pattern. If the styles are only intended for a particular page template, prefix your class with the template name. For example: `.callout-link` for generic styles for links in callouts, and `.homepage-callout-link` for link styles that apply to homepage callouts only. Only list the descendant you're currently working with in your class name.
* **Hyphenation** Hyphenate whenever you would normally use a space. For example, a homepage callout link would be written `.homepage-callout-link`.
* **Stateful classes** use `.is-` to prefix classes often toggled by JavaScript, like `.is-disabled`.

<a name="ids-and-classes">
### IDs & Classes

Only use IDs for top level layout elements such as `sidebar` or `masthead`. Use classes for everything else unless an ID is needed for JavaScript. IDs and classes are hyphenated. For more information, see [Component Naming](#components)).

**Exceptions:** JavaScript selectors that you can guarantee only happen once on a page. In general, you should not style IDs, as our goal is to write modular, reusable styles.

##### Example:

```css
.button-primary {}
.post-headline {}
```

<a name="specificity"></a>
### Specificity

Too much *cascading* of stylesheets can introduce [unnecessary performance](https://developers.google.com/speed/docs/insights/PrioritizeVisibleContent#UseEfficientCSSSelectors) overhead. It also makes reusing styles in other places difficult, and can introduce unexpected styling results down the line. In general, only be as specific as you absolutely need to be.

For each level of nesting and specificity you introduce on a CSS selector, you need _at least that many levels_ to override the style later on in the stylesheet. For example, to override a general list style written as `.content-area ul li` for a set of callouts that also shows in the content area, you must write _at least_ `.section-callouts ul li` in order for the style to override. This can lead to very complex CSS very quickly and snowballs throughout projects, so take great care to nip this in the bud when you see it.

Another unintended consequence of overly specific CSS rules are that they're usually closely tied to HTML structure. This means if you have to change your HTML down the line, the rule will break too.

**Exceptions:** At times where it would be a burden to add classes to make a simpler rule possible, it's fine to nest under one class and style by tag. For example, in a longform editorial article, instead of giving every `<p>` tag a class of `.article-paragraph`, it makes more sense to write a rule like `.article p`, even though it's a little more specific. Always balance your judgements on specificity with consideration for ease of editing markup to add classes, as well as the potential for unintended styling issues down the road.

##### Example:

```css
/* Good, because we're working with metadata in a PHP template, and it's easy to add classes to our callout paragraph. */
.homepage-callout-description { color: red; }

/* Too specific - and what happens if you want to change to the more semantic <aside> tag? */
ul.homepage-callout li a .homepage-callout-description { color: red; }

/* Good, because <p> is controlled by the WordPress editor and it would be a huge development burden to hand-add and maintain classes on each individual <p> tag generated by the editor: */
.article-text p { color: red; }
```

<a name="javascript">
### JavaScript Selectors

syntax: `js-target-name`

JavaScript-specific classes and IDs reduce the risk that changing the structure or theme of components will inadvertently affect any required JavaScript behaviour and complex functionality. It is not necessary to use them in every case - just think of them as a tool in your utility belt. **JavaScript-specific classes should not, under any circumstances, be styled.** If you need to style that element, just add another class. In practice this looks like this:

```html
<a href="/login" class="button-primary button-login js-login"></a>
```

<a name="utilities">
### Utilities

Utility classes are simple structural and positional traits abstracted for use on any element. Multiple utilities can be used together, and utilities can be used alongside components. Utilities are great for common CSS patterns, or for applying very simple styles to quickly prototype and demonstrate functionality. For example, you might use the `.u-visuallyhidden` class to hide text visually, but keep it screen reader accessible. Or, you might use `.u-show` and `.u-hide` while writing JavaScript to demonstrate filtering functionality very quickly, without worrying about writing fancy CSS styles.

When using Sass, consider using the matching `%u-` placeholders that Responsive Foundation provides to get the benefits of utility classes, while keeping the PHP and HTML markup clean and easy to read.

##### Naming:

syntax: `u-utility-name`

Utilities should be hyphenated and prefixed with `u-`. The name should accurately describe what the utility class will do when applied.

##### Example:

A screen-reader accessible Facebook social icon, without text.

```css
`<a href="#" class="social-link-facebook u-visuallyhidden">Facebook</a>
```

<a name="components">
### Components

Components are small, reusable elements that have specific styles and behaviour that all work together in harmony, and work independently of the content and structure around them. When writing components, try to think of what the general styles that would work anywhere might be. Then, add additional scoped styles for different page templates as needed.

For example, a common pattern is to have a callouts component that looks a little different on the homepage template. A good way to structure this in CSS might look like:

```css
.callout {
	background: #fff;
	color: #777;
}

.homepage .callout {
	background: #ccc;
}
```

In Sass, a good pattern is to write your general styles first, and then write exceptions to those styles after.

```scss
.callout {
	background: #fff;
	color: #777;

	.homepage & {
		background: #ccc;
	}
}
```

Subcompontents are the pieces that work together to make a component. When naming subcomponents, scope them to your component name, but only use the name of the subcomponent you're working with in your selector. In other words, in a situation like this:

```html
<aside class="callout">
	<a href="#" class="callout-link">
		<p class="callout-description">Hello</p>
	</a>
</aside>
```

The paragraph subcomponent's name should be `.callout-description`, not `.callout-link-description`. Even though the description is a child of `.callout-link`, the _component_ is `.callout`, so the class should be scoped to that. HTML structure can change throughout the project in components as bugs are fixed and styles are added, and by keeping our naming flat and independent of how our HTML is written, we can make adjustments over time without worrying about changing our class names over and over again.

##### Naming:

All classes should be hyphenated, once per word. As you name things, make sure the name is descriptive of the component and what it does. Be very careful with introducing unnecessarily global classes that could be used in many, many places, such as `.info`.

Class names should be readable and easy to understand. Common knowledge abbreviations that appear in HTML element naming, such as `nav`, are great to use. Abbreviations that require you to know our environment to understand, such as `.hp-`, or could be easily misunderstood for a common CSS pattern like clearfix, such as `.cf-`, are not. Above all, the naming should make clear to anyone reading through your CSS what the impact of editing styles in your rules will be.

syntax: `component-subcomponent-modifier`

##### Examples:

```css
.primary-nav {
	(...)
}

.primary-nav-menu {
	(...)
}

.primary-nav-item {
	(...)
}

/* Modifiers can also be appended to components without subcomponents */

.button {
	(...)
}

.button-primary {
	(...)
}

/* In markup */

<section class="callouts homepage-callouts">
	<aside class="callout">
		<a class="callout-link">...</a>
	</aside>
</section>

```

<a name="naming-images"></a>
### Images

Image file names are lowercase with words separated by a dash. File names are prefixed with their usage.

##### Example:

```css
icon-home.png
bg-container.jpg
bg-home.jpg
sprite-top-navigation.png
```

<a name="variables"></a>
## Variables

Naming conventions - hyphenated

<a name="colors"></a>
### Colors

Use **Sass variables** for color whenever possible. When specifying colors, use the following conventions:

* **HEX:** Always use lowercase. Shorthand like `#ccc` should be used where possible.
* **RGBA:** Remember to include a leading 0 for all decimals, like `rgba(0, 0, 0, 0.5)`.

<a name="fonts"></a>
### Fonts

#### Font Weight

With the additional support of web fonts font-weight plays a more important role than it once did. Different font weights will render typefaces specifically created for that weight, unlike the old days where bold could be just an algorithm to fatten a typeface. Always use the numerical value of font-weight to enable the best representation of a typeface, like `font-weight: 400;`.

Whenever possible use `@extend` to specify appropriate baseline font styles:

```css
@extend %font-size-1; // Matches <h1> size and line-height styles
@extend %font-size-2;
@extend %font-size-3;
@extend %font-size-4;
@extend %font-size-5;
@extend %font-size-6;
```

<a name="zindex"></a>
## Z-index

We're modeling Medium's z-index scale, which uses well-named variables to help keep layering in check.

##### Example:

```css
// Z-Index Scale (private vars)
// --------------------------------------------------
$z-index-1:   100;
$z-index-2:   200;
$z-index-3:   300;
$z-index-4:   400;
$z-index-5:   500;
$z-index-6:   600;
$z-index-7:   700;
$z-index-8:   800;
$z-index-9:   900;
$z-index-10: 1000;

// Z-Index Applications
// --------------------------------------------------
$z-index-content:                   $z-index-1;
$z-index-states:                    $z-index-3;
$z-index-panels:                    $z-index-5;
$z-index-primarynav:                $z-index-7;
$z-index-overlays:                  $z-index-9;
$z-index-dev:                       $z-index-10;
...
```

<a name="mixins"></a>
### Mixins

syntax: `@mixin mixin-name { ... }`

Mixins work best when you have a set of styles you want to reuse, but you need some
flexibility and options for the styles they're spitting out. For example, our icons
mixin allows you to choose either the before or after pseudo-element to place the icon
on.

If you're not passing any arguments to your mixin, consider using an equivalent placeholder
class instead. All mixins that can be used this way in Foundation have a matching
Sass placeholder you can use. Placeholders group selectors instead of repeating styles, so
it's a good idea to use them when you can.

**Exceptions:** A placeholder might not always work if the original placeholder styles are
declared too far up in your stylesheet, and you need to override some other styles which
come after it. In this case, go ahead and use the matching mixin instead. It's better to
repeat those styles than introduce additional specificity to your selectors.

<a name="media queries"></a>
#### Media Queries

Our codebase is written mobile-first, and we strive to keep to that as best as we can.

Use the `breakpoint` mixin for any media query that is written mobile-first. This mixin
automatically prints styles in a way that older versions of Internet Explorer can
understand in a separate stylesheet.

Use the `retina` mixin if you need to target retina devices, such as for serving a larger
image.

Use the default breakpoints when possible. When it's not possible, use a variable that
describes the new breakpoint you're adding. For example, you may add `$bp-mobile-nav`
to indicate the breakpoint where the mobile nav styles will switch to desktop styles.

All `breakpoint` and `retina` mixins should be written _inside_ the selector, in order
of smallest to largest, when writing Sass. See example below.

**Exceptions:** In certain limited cases, it's easier to write a simple `max-width`
media query than to write mobile-first CSS. Our breakpoints mixin doesn't support
this, but as long as your styles only apply to mobile devices, this is fine. The
main thing the breakpoints mixin does for you is create an IE stylesheet, and you'll
be missing the benefits of that by writing a plain CSS media query. However, the changes
of someone visiting a site at a mobile size on IE8 are very slim.

##### Example:

```css
.primary-nav {
	@include breakpoint( $xs ) {
		// Styles for the $xs breakpoint
	}
}
```
<a name="sources"></a>
## Sources

Many of these standards have been taken or adapted from the smart people who wrote:

* [https://github.com/necolas/idiomatic-css](https://github.com/necolas/idiomatic-css)
* [https://gist.github.com/fat/a47b882eb5f84293c4ed#performance](https://gist.github.com/fat/a47b882eb5f84293c4ed#performance)
* [https://medium.com/@fat/mediums-css-is-actually-pretty-fucking-good-b8e2a6c78b06](https://medium.com/@fat/mediums-css-is-actually-pretty-fucking-good-b8e2a6c78b06)
