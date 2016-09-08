# CSS & Sass Standards

**Table of contents**

* [Principles](#principles)
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
## Priciples

These guidelines strongly encourage the use of sensible patterns that model the best of what's out there. The goal is to write extremely lean styles with maximum clarity that leverage preprocessing to optimize both workflow and site performance.

* Keep all code readable and understandable while writing as little as possible.
* All code in our code-base should look like a single person typed it, even when many people are contributing to it.
* This is a living document, and new ideas are always welcome. Please contribute.
* Everyone strictly enforces the agreed-upon style.

<a name="formatting"></a>
## General Formatting

* Use new lines for each selector, declaration, and closing `}` <br>*(ProTip: configure your editor to "show invisibles" or to automatically remove end-of-line whitespace.)*
* Set indentation to **tabs**, not spaces. <br>*(ProTip: some editors like Sublime will let you set your preferred tab width for code viewing.)*
* Selectors are **flush left** except those nested within media queries or pseudo-elements
* Use one level of indentation for each declaration
* Include a single space before a `{`, after a `:`, and after each `,` in comma-separated properties and values
* Use double quotes consistently: `content: " "`
* Quote attribute values in selectors: `input[type="checkbox"]`
* Avoid specifying units for zero-values: `margin: 0;`
* Place the closing `}` of a ruleset in the same column as the first character of the ruleset
* Include a blank line before and after sections but not between rulesets

##### Example:

```css
.selectorOne,
.selectorTwo {
	position: absolute;
	top: 0;
}
.selectorThree {
	color: #ccc;
	margin: 0;
}
```

<a name="declaration-order"></a>
## Declaration Order

Declarations are to be consistently ordered based on a simple principle:

1. Positioning
2. Display & Box Model
3. Typography
4. Everything Else

##### Example:

```css
.selector {
    /* Positioning */
    position: absolute;
    z-index: 10;
    top: 0;
    right: 0;
    bottom: 0;
    left: 0;

    /* Display & Box Model */
    display: inline-block;
    overflow: hidden;
    box-sizing: border-box;
    width: 100px;
    height: 100px;
    margin: 10px;
    padding: 10px;
    border: 10px solid #333;

    /* Typography */
    font-family: sans-serif;
    font-size: 16px;
    text-align: right;
    color: #fff;

    /* Everything Else */
    background: #000;
    feelings: optimistic;
}
```

Comments above are for demonstration only. Within each chunk list declarations in order of importance, stacking related rules (e.g., width and height, margin and padding).

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

* Always place `@extend` statements on the first line of a declaration block.
* Group `@include` statements at the top of a declaration block after any `@extend` statements except for `@include breakpoint`, which you should put after your base (mobile) styles.
* Don't nest declaration blocks. It makes code hard to read on complex projects and often results unecessarily specific selectors.
* Nesting [psuedo-classes](https://developer.mozilla.org/en-US/docs/Web/CSS/Pseudo-classes) and media queries is OK. They should be last in the declaration block, separated from other properties with an empty new line.

##### Example:

```css
.selector {
    @extend %someRule;
    @include clearFix();
    @include boxSizing(border-box);
    width: gridUnit(1);

    &:last-child {
    	...
    }

    @media only screen and (min-width : 320px) {
      ...
    }
}
```

<a name="vendor-prefixes"></a>
## Vendor Prefixes

Use Sass mixins whenever possible. When writing CSS, use indentation to align values.

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

* **Javascript:*** `.js-` prefixed class names for elements being relied upon for JavaScript selectors
* **Utilities** are prefixed with `.u-` for single purpose utility classes like `.u-underline` and `.u-capitalize`
* **Meaningful hypens and camelCase** clarify the separation between component, descendant components, and modifiers: `componentName-subComponent-modifier`
* **Stateful classes** use `.is-` to prefix classes often toggled by JavaScript, like `.is-disabled`

<a name="ids-and-classes">
### IDs & Classes

Only use IDs for top level layout elements such as `sidebar` or `masthead`. Use classes for everything else unless an ID is needed for JavaScript. IDs and classes are camelCase with hyphens separating elements that demonstrate hierarchal relationships (see [Component Naming](#components))*.

##### Example:

```css
.btn-primary {}
.post-postHeader {}
```

<a name="specificity"></a>
### Specificity

Too much *cascading* of stylesheets can introduce [unnecessary performance](https://developers.google.com/speed/docs/insights/PrioritizeVisibleContent#UseEfficientCSSSelectors) overhead. In general, only be as specific as you need to be.

##### Example:

```css
/* Good: */
.userList a:hover { color: red; }

/* Too specific: */
ul.userList li span a:hover { color: red; }
```

<a name="javascript">
### JavaScript Selectors

syntax: `js-targetName`

JavaScript-specific classes reduce the risk that changing the structure or theme of components will inadvertently affect any required JavaScript behaviour and complex functionality. It is not neccesarry to use them in every case, just think of them as a tool in your utility belt. If you are creating a class, which you dont intend to use for styling, but instead only as a selector in JavaScript, you should probably be adding the `js-` prefix, but **JavaScript-specific classes should not, under any circumstances, be styled.** In practice this looks like this:

```css
<a href="/login" class="btn btn-primary js-login"></a>
```

<a name="utilities">
### Utilities

Utility classes are simple structural and positional traits abstracted for use on any element. Multiple utilities can be used together, and utilities can be used alongside components. Utilities exist because certain CSS properties and patterns are used frequently. For example: clearing floats, vertical alignment, text truncation. Relying on utilities can help to reduce repetition and provide consistent implementations.

##### Naming:

syntax: `u-utilityName`

Utilities must use a camelCase name, prefixed with a `u-` namespace. What follows is an example of how various utilities can be used to create a simple structure within a component.

##### Example:

```css
<div class="u-clearFix">
  <p class="u-textTruncate">...</p>
  <img class="u-pullLeft" src="..." alt="...">
</div>
```

<a name="components">
### Components

Components are custom elements that enclose specific semantics, styling, and behaviour. Always look to abstract components. The reuse of components across designs helps to improve consistency and reduces code overhead. A name like `.homepageNews` limits its use. Instead think about writing styles in such a way that they can be reused in other parts of the app. Try instead `.newsList`, which could be reused in another context.

A subcomponent is a descendant of a component. It's main purpose is to describe and style a permanent part of a component, like `.newsPost-metaData`.

##### Naming:

Component and subcompontent names must be written in camelCase. Modifiers are lowercase with hyphens.

syntax: `componentName-subComponent-modifier`

##### Example:

```css
.navBar {...}
.navBar-contentNav {...}
.navBar-contentNav-collabsible {...}

/* Modifiers can also be appended to components without subcomponents */

.btn {...}
.btn-primary {...}
.btn-inactive {...}

/* In markup */

<ul class="slideShow">
  <li class="slideShow-slide slideShow-slide-eventPromo">
    <a>...</a>
  </li>
</ul>

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

TODO

<a name="colors"></a>
### Colors

Use **Sass variables** for color whenever possible. When specifying colors, use the following conventions:

* **HEX:** Always use lowercase. Shorthand like `#ccc` is OK.
* **RGBA:** Remember to include a leading 0 for all decimals, like `rgba(0, 0, 0, 0.5)`.

<a name="fonts"></a>
### Fonts

TODO: how @font-face is used and how to specify shared typographic styles.

#### Font Weight

With the additional support of web fonts font-weight plays a more important role than it once did. Different font weights will render typefaces specifically created for that weight, unlike the old days where bold could be just an algorithm to fatten a typeface. Always use the numerical value of font-weight to enable the best representation of a typeface, like `font-weight: 400;`.

Whenever possible use `@extend` to specify appropriate baseline font styles:

```css
$fontSize-micro
$fontSize-smallest
$fontSize-smaller
$fontSize-small
$fontSize-base
$fontSize-large
$fontSize-larger
$fontSize-largest
$fontSize-jumbo
```

(**TODO:** Create the above variables.)

<a name="zindex"></a>
## Z-index

We're modeling Medium's z-index scale, which relies on variables to manage collision-free layers.

##### Example:

```css
// Z-Index Scale (private vars)
// --------------------------------------------------
$zIndex-1:   100;
$zIndex-2:   200;
$zIndex-3:   300;
$zIndex-4:   400;
$zIndex-5:   500;
$zIndex-6:   600;
$zIndex-7:   700;
$zIndex-8:   800;
$zIndex-9:   900;
$zIndex-10: 1000;

// Z-Index Applications
// --------------------------------------------------
$zIndex-1-screenForeground:        @zIndex-1;
$zIndex-1-followUpVisibility:      @zIndex-1;
$zIndex-2-prlWelcome:              @zIndex-2;
$zIndex-2-appImageDropdown:        @zIndex-2;
$zIndex-3-surfaceUnder:            @zIndex-3;
$zIndex-4-blockGroup:              @zIndex-4;
...
```

<a name="mixins"></a>
### Mixins

syntax: `mixinName`

Mixins should only be used when there are dynamic properties, otherwise use @extend. Mixins should use camelCase and be well documented in comments.

<a name="media queries"></a>
#### Media Queries

TODO

##### Example:

```css
@include breakpoint(small) {
  .selector {...}
}
```
<a name="sources"></a>
## Sources

Many of these standards have been taken or adapted from the smart people who wrote:

* [https://github.com/necolas/idiomatic-css](https://github.com/necolas/idiomatic-css)
* [https://gist.github.com/fat/a47b882eb5f84293c4ed#performance](https://gist.github.com/fat/a47b882eb5f84293c4ed#performance)
* [https://medium.com/@fat/mediums-css-is-actually-pretty-fucking-good-b8e2a6c78b06](https://medium.com/@fat/mediums-css-is-actually-pretty-fucking-good-b8e2a6c78b06)

