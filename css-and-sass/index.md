# CSS & SASS Standards

*SASS is natural. SASS is fun. SASS is best when it's expertly done.* 

## Priciples

These guidelines strongly encourage the use of sensible patterns that model the best of what's out there. The goal is to write extremely lean styles with maximum clarity that leverage preprocessing to optimize both workflow and site performance.

* Keep all code readable and understandable while writing as little as possible
* All code in our code-base should look like a single person typed it, even when many people are contributing to it.
* This is a living document, and new ideas are always welcome. Please contribute.
* Everyone strictly enforces the agreed-upon style.

## Formatting

* Use new lines for each selector, declaration, and closing `}` <br>*(Protip: configure your editor to "show invisibles" or to automatically remove end-of-line whitespace.)*
* Set indentation to **tabs**, not spaces. <br>*(Protip: some text editors like Sublime will let you set your preferred tab width for code viewing.)*
* Selectors are **flush left** except those nested within media queries
* Use one level of indentation for each declaration
* Include a single space before a `{`, after the `;` of a declaration and after each comma in comma-separated property or function values
* Use double quotes consistently: `content: " "`
* Quote attribute values in selectors: `input[type="checkbox"]`
* Avoid specifying units for zero-values: `margin: 0;`
* Place the closing `}` of a ruleset in the same column as the first character of the ruleset
* Include a blank line before and after sections but not between rulesets

#### Example
<pre>
```css
.selector-1,
.selector-2 {
	position: absolute;
	top: 0;
}
.selector-a {
	color: #ccc;
	margin: 0;
}
```
</pre>

## Declaration order

Declarations are to be consistently ordered based on a simple principle:

1. Positioning
2. Display & Box Model
3. Typography
4. Everything Else

#### Example
<pre>
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
</pre>

Comments above are for demonstration only. Within each chunk list declarations in order of importance, stacking related rules (e.g., width and height, margin and padding).


### IDs *vs.* Classes

Use classes for everything unless an ID is needed (e.g., for JavaScript).

### Comments

Well commented code is extremely important. Take time to describe components, how they work, their limitations, and the way they are constructed.

* Place comments on a new line above subject.
* Make liberal use of comments to break CSS code into discrete sections.
* Use `/* */` CSS comments. No need to use `//` SASS comments since Grunt should be configured to remove them all from the output.
* Add `TODO` comments detailing unfinished tasks.

#### Example
<pre>
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
</pre>

## Colors

Use SASS variables for color whenever possible *(see section on naming conventions)*. When specifying colors, use the following conventions:

* **HEX:** Always use lowercase. Shorthand like `#ccc` is OK.
* **RGBA:** Remember to include a leading 0 for all decimals, like `rgba(0, 0, 0, 0.5)`.

### Vendor Prefixes

Use SASS mixins whenever possible. When writing CSS, use indentation to align values.

#### Example
<pre>
```css
.thing {
	-webkit-transition: background-color 500ms ease-out 1s;
	   -moz-transition: background-color 500ms ease-out 1s;
	     -o-transition: background-color 500ms ease-out 1s;
	        transition: background-color 500ms ease-out 1s;
}
```
</pre>

## Z-index

We're modeling after Medium's z-index scale, which relies on variables to manage collision-free layers.

#### Example
<pre>
```css
// Z-Index Scale (private vars)
// --------------------------------------------------
@zIndex-1:   100;
@zIndex-2:   200;
@zIndex-3:   300;
@zIndex-4:   400;
@zIndex-5:   500;
@zIndex-6:   600;
@zIndex-7:   700;
@zIndex-8:   800;
@zIndex-9:   900;
@zIndex-10: 1000;
 
// Z-Index Applications
// --------------------------------------------------
@zIndex-1--screenForeground:        @zIndex-1;
@zIndex-1--followUpVisibility:      @zIndex-1;
@zIndex-1--prlWelcome:              @zIndex-1;
@zIndex-1--appImageDropdown:        @zIndex-1;
@zIndex-1--surfaceUnder:            @zIndex-1;
@zIndex-1--blockGroup:              @zIndex-1;
```
</pre>

## SASS

All CSS standards apply to SCSS, too. This section defines how to use the additional features of SASS.

### General

* Always place `@extend` statements on the first line of a declaration block.
* Group `@include` statements at the top of a declaration block after any `@extend` statements.
* Don't nest declaration blocks. It makes code hard to read on complex projects and often results unecessarily specific selectors. 
* Nesting media queries is OK.

#### Example
<pre>
```css
.selector {
    @extend .some-rule;
    @include clearfix();
    @include box-sizing(border-box);
    width: x-grid-unit(1);
    ...
}
```
</pre>

### Naming Conventions

TODO

### Variables

TODO

### Mixins

* Mixins should only be used when there are dynamic properties, otherwise use @extend.
* Mixins should be documented in comments

## Sources

Inspiration for these standards taken from:

* [https://github.com/necolas/idiomatic-css](https://github.com/necolas/idiomatic-css)
* [https://medium.com/@fat/mediums-css-is-actually-pretty-fucking-good-b8e2a6c78b06](https://medium.com/@fat/mediums-css-is-actually-pretty-fucking-good-b8e2a6c78b06)

