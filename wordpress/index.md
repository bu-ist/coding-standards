# WordPress Coding Standards

All WordPress plugins and themes should adhere to the standards established in the core contributor handbooks:
https://make.wordpress.org/core/handbook/coding-standards/

## General

* Be mindful of [PHPs global namespace](http://php.net/manual/en/language.namespaces.global.php). All functions and classes should be prefixed consistently within the plugin or theme.

```php
<?php

// Bad
function print_styles() {
	...
}

// Good
function flexi_print_styles() {
	...
}
```

* Omit closing PHP tags (`?>`) at the end of every file. Trailing whitespace after closing tags can [cause issues](https://wordpress.org/support/topic/functionsphp-in-a-child-theme). The easiest way to avoid them is not to use them.

## Themes

* Keep your template files clean and lean. Avoid complex PHP logic. Avoid duplicating code across templates. Leverage well-named functions.
* Always use `wp_enqueue_*` functions for loading Javascript and CSS assets unless there is a compelling reason not to do so. Understand [their](http://codex.wordpress.org/Function_Reference/wp_enqueue_style) [arguments](http://codex.wordpress.org/Function_Reference/wp_enqueue_script). Take advantage of the dependency argument for cache busting.
* Usage of any functions or classes defined outside of the current theme should always be wrapped in a `function_exists` or `class_exists` conditional to prevent PHP fatal errors if a plugin is not activated.
