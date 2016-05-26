# WordPress Coding Standards & Best Practices

Below is a collection of WordPress/PHP best practices that should be followed in **all code**.

Because there are other, well maintained best practice manuals available, this guide is meant to supplement them with summaries of the most important items with some internal context. You are encouraged to read through the resources linked at the end of this guide in full.

Those guides are:

* [WordPress PHP Coding Standards](https://make.wordpress.org/core/handbook/best-practices/coding-standards/php/)
* [10up Engineering Best Practices](https://10up.github.io/Engineering-Best-Practices/)
* [WordPress VIP Code Review Checklist](https://vip.wordpress.com/documentation/vip/code-review-what-we-look-for/)
* [WordPress Coding Standards PHP_CodeSniffer](https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards)

## PHP Code Formatting

A full breakdown of PHP code formatting standards can be found in the [WordPress Best Practices Handbook](https://make.wordpress.org/core/handbook/best-practices/coding-standards/php/).

# PHP Namespacing

Be mindful of [PHPs global namespace](http://php.net/manual/en/language.namespaces.global.php). All functions and classes should be prefixed consistently within the plugin or theme.

```php
/**
 * Example 1
 */
 // Bad
function enqueue_styles() {
	...
}
add_action( 'wp_enqueue_styles', 'enqueue_styles' );

// Good
function r_mytheme_wp_enqueue_styles() {
	...
}
add_action( 'wp_enqueue_styles', 'r_mytheme_wp_enqueue_styles' );

/**
 * Example 2
 */
// Bad
function enqueue_scripts() {
	...
}
add_action( 'wp_enqueue_scripts', 'enqueue_scripts' );

// Good
function bu_myplugin_wp_enqueue_styles() {
	...
}
add_action( 'wp_enqueue_styles', 'bu_myplugin_wp_enqueue_styles' );
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
* [10up Engineering Best Practices - Namespacing](https://10up.github.io/Engineering-Best-Practices/php/#namespacing)

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
* [`wp_kses_*` functions](https://developer.wordpress.org/reference/functions/wp_kses/) (kses strips evil scripts)

Example of how printing an `<a>` with proper escaping.

```
<a href="<?php echo esc_url( $some_url ); ?>" title="<?php esc_attr_e( $some_title ); ?>"><?php esc_html_e
```

Example of how to use `wp_kses()` to only allow `<a>`, `<br>`, `<em>`, and `<strong>` tags.

```
$allowed_tags = array(
    'a' => array(
        'href' => array(),
        'title' => array()
    ),
    'br' => array(),
    'em' => array(),
    'strong' => array(),
);

$sanitized_html_string = wp_kses( $string, $allowed_tags ); 
```

### More Information

* [Validating, Sanitizing, and Escaping (VIP Documentation)](https://vip.wordpress.com/documentation/vip/best-practices/security/validating-sanitizing-escaping/)
* [Data Validation Codex Page](https://codex.wordpress.org/Data_Validation)
* [The Importance of Escaping All The Things](https://vip.wordpress.com/2014/06/20/the-importance-of-escaping-all-the-things/)


## PHP Tags

Always omit closing PHP tags (`?>`) at the end of every file. Trailing whitespace after closing tags can cause issues such as ‘Headers already sent‘ errors.

**Always** use full [opening tags](http://php.net/manual/en/language.basic-syntax.phptags.php) (`<?php`) in PHP. Short tags (`<?`,`<?=`) **will** have issues in our environment.

**More info:** [WordPress PHP Coding Standards](https://make.wordpress.org/core/handbook/best-practices/coding-standards/php/#no-shorthand-php-tags)

## Themes

* Keep your template files clean and lean. Avoid complex PHP logic.
* Avoid duplicating code across templates. If something will be utilized in multiple areas, it should have a well named function for returning the data, or a template file.
* Always enqueue Javascript and CSS assets unless there is a compelling reason not to do so. Understand [their](http://codex.wordpress.org/Function_Reference/wp_enqueue_style) [arguments](http://codex.wordpress.org/Function_Reference/wp_enqueue_script).
	* Take advantage of the version arguments in `wp_enqueue_script()` and `wp_enqueue_style()` for [cache busting](https://pippinsplugins.com/uncached-script-and-style-updates/).
* Usage of any functions or classes defined outside of the current theme should always be wrapped in a `function_exists` or `class_exists` conditional to prevent PHP fatal errors in the absence of a plugin.

## Performance

### Avoid Uncached Functions

Uncached functions circumvent WordPress' object caching, resulting in database queries every time it is called. Whenever possible, uncached functions should be avoided. Some examples are:

* `wp_get_post_terms()`, `wp_get_object_terms()`, etc.
	* These functions hit the database every time. Use `get_the_terms()` instead. Use in combination with `wp_list_pluck()` to get a list of a specific field, such as `term_id`.
* `get_posts()`
	* Use `WP_Query` instead, or set `suppress_filters => false`.
	* When using `WP_Query` instead of get_posts don’t forget about setting `ignore_sticky_posts` and `no_found_rows` params appropriately (both are hardcoded inside a get_posts function with value of true)
	* `get_children()`
		* Similar to `get_posts()`, but also performs a no-LIMIT query among other bad things by default. Alias of `break_my_site_now_please()`. Do not use. Instead do a regular `WP_Query` and make sure that the `post_parent` you are looking for is not 0 or a falsey value. Also make sure to set a reasonable `posts_per_page`, `get_children` will do a -1 query by default, a maximum of 100 should be used (but a smaller value could increase performance).

**More info:** [VIP Uncached Functions](https://vip.wordpress.com/documentation/caching/uncached-functions/)

### Always define `post_type` and `post_status` arguments

> By default the `post_status` of a query is set to publish for anonymous users on the front end. It is not set in any `WP_ADMIN` context including Ajax queries. Queries on the front end for logged in users will also contain an OR statement for private posts created by the logged in user, even if that user is not part of the site. This will reduce the effectiveness of MySQL indexes, specifically the `type_status_date` index.
 
> The same is true for `post_type`, if you know that only a certain post_type will match the rest of the query (for example for a taxonomy, meta or just general query) adding the `post_type` as well as the `post_status` will help MySQL better utilize the indexes as it’s disposal.

**More info:** [VIP Code Review Checklist](https://vip.wordpress.com/documentation/vip/code-review-what-we-look-for/#not-defining-post_status-or-post_type)

### Avoid no `LIMIT` queries

You should never pass a `posts_per_page` value of `-1`. This can be dangerous when sites scale and there are far more results than expected. Use a high limit such as 100 instead. If you need to retrieve large numbers of posts, [use a `while()` loop](https://gist.github.com/desrosj/de6a3923c61f5b4a3046a643e286abab).

```
$posts = array();

$args = array(
  'posts_per_page' => 100,
  'offset'         => 0,
  'post_type'      => 'post',
  'post_status'    => 'publish',
);

$my_query = new WP_Query( $args );

while ( $my_query->have_posts() ) {
  $posts = array_merge( $posts, $my_query->posts );
  
  $args['offset'] = $args['offset'] + $args['posts_per_page'];
  $my_query = new WP_Query( $args );
}
```

**More info:** [VIP Code Review Checklist](https://vip.wordpress.com/documentation/vip/code-review-what-we-look-for/#no-limit-queries)

### Never make direct database calls

Avoid direct database queries. WordPress has built-in functionality for getting information in and out of the database. Using these functions wherever possible makes sure that you are benefiting from any optimizations or caching that is already implemented within those functions.

If there are scenarios where a direct database call cannot be avoided, follow some of these guidelines.

* Make sure that all your queries are protected against SQL injection by making use of `$wpdb->prepare` and other escaping functions like `esc_sql` and `like_escape`.
* Use filters to adjust queries to your needs. Filters such as `posts_where` can help adjust the default queries done by `WP_Query`. This helps keep your code compatible with other plugins.
* Remember that the database is not a tool box. Although you might be able to perform a lot of work on the database side, your code will scale much better by keeping database queries simple and performing necessary calculations and logic in PHP.
* Cache the results of queries where it makes sense.

**More info:** [WordPress VIP Best Practices - Database Queries](https://vip.wordpress.com/documentation/vip/best-practices/database-queries/)

### Utilize `no_found_rows` when possible

When the query you are running does not need any of the following contexts, define `no_found_rows => true` in your `WP_Query` arguments.

* `$wp_query->found_posts` property
* `$wp_query->max_num_pages` property
* Any pagination functionality

`no_found_rows` prevents an extra `COUNT()` query that tallies the total number of posts matching given query arguments.

**More info:** [10up Engineering Best Practices](https://10up.github.io/Engineering-Best-Practices/)