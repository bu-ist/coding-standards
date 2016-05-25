# WordPress Coding Standards & Best Practices

Below is a collection of WordPress/PHP best practices that should be followed in **all code**.

Because there are other, well maintained best practice manuals available, this guide is meant to supplement them with summaries of the most important items with some internal context. You are encouraged to read through the resources linked at the end of this guide in full.

## PHP Code Formatting

A full breakdown of PHP code formatting standards can be found in the [WordPress Best Practices Handbook](https://make.wordpress.org/core/handbook/best-practices/coding-standards/php/).

# PHP Namespacing

Be mindful of [PHPs global namespace](http://php.net/manual/en/language.namespaces.global.php). All functions and classes should be prefixed consistently within the plugin or theme.

```php
// Bad
function enqueue_styles() {
	...
}
add_action( 'wp_enqueue_styles', 'enqueue_styles' );

// Good
function bu_wp_enqueue_styles() {
	...
}
add_action( 'wp_enqueue_styles', 'bu_wp_enqueue_styles' );
```
When it makes sense, like functionality should be grouped into a class. For example, say we are working with course functionality.

```php
class BU_Courses {
	function __construct() {
		add_action( 'init', array( $this, 'init' ) );
		add_action( 'wp_enqueue_scripts', array( $this, 'wp_enqueue_scripts' ) );
	}
	
	function init() { ... }
	
	function wp_enqueue_scripts() { ... }
}
```
Using this pseudo namespacing, we can use function names that match the action hooks they are linked to for basic things without conflicting with the global namespace. This helps stay organized, and clearly see what is happening on specific action hooks.

### More Information

* [Prefix All The Things](https://nacin.com/2010/05/11/in-wordpress-prefix-everything/)

## Data Validation/Sanitization

Untrusted data comes from many sources (users, third party sites, your own database!, ...) and all of it needs to be validated both on input and output. 

### Guiding Principles

1. Never trust user input.
1. Escape as late as possible.
1. Escape everything from untrusted sources (like databases and users), third-parties (like Twitter), etc.
1. Never assume anything.
1. Never trust user input.
1. Sanitation is okay, but validation/rejection is better.
1. Never trust user input.

WordPress has many functions to help with many scenarios. Here are a few:

* [`sanitize_text_field()`](https://codex.wordpress.org/Function_Reference/sanitize_text_field)
* [`esc_html()`](https://codex.wordpress.org/Function_Reference/esc_html)
* [`esc_attr()`](https://codex.wordpress.org/Function_Reference/esc_attr)
* [`esc_url()`](https://codex.wordpress.org/Function_Reference/esc_url)
* [`esc_js()`](https://codex.wordpress.org/Function_Reference/esc_js)

### More Information

* [Validating, Sanitizing, and Escaping (VIP Documentation)](https://vip.wordpress.com/documentation/vip/best-practices/security/validating-sanitizing-escaping/)
* [Data Validation Codex Page](https://codex.wordpress.org/Data_Validation)
* [The Importance of Escaping All The Things](https://vip.wordpress.com/2014/06/20/the-importance-of-escaping-all-the-things/)


## PHP Tags

Always omit closing PHP tags (`?>`) at the end of every file. Trailing whitespace after closing tags can cause issues such as ‘Headers already sent‘ errors.

**Always** use full [opening tags](http://php.net/manual/en/language.basic-syntax.phptags.php) (`<?php`) in PHP. Short tags (`<?`,`<?=`) **will** have issues in our environment

## Themes

* Keep your template files clean and lean. Avoid complex PHP logic. Avoid duplicating code across templates. Leverage well-named functions.
* Always use `wp_enqueue_*` functions for loading Javascript and CSS assets unless there is a compelling reason not to do so. Understand [their](http://codex.wordpress.org/Function_Reference/wp_enqueue_style) [arguments](http://codex.wordpress.org/Function_Reference/wp_enqueue_script). Take advantage of the [version argument for cache busting](https://pippinsplugins.com/uncached-script-and-style-updates/).
* Usage of any functions or classes defined outside of the current theme should always be wrapped in a `function_exists` or `class_exists` conditional to prevent PHP fatal errors if a plugin is not activated.
