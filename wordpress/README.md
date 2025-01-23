# WordPress Coding Standards & Best Practices

Below is a collection of WordPress best practices that should be followed in **all code**.

Because there are other, well maintained best practice manuals available, this guide is meant to supplement them with summaries of the most important items with some internal context. You are encouraged to read through the resources linked at the end of this guide in full.

Those guides are:

* [10up Engineering Best Practices](https://10up.github.io/Engineering-Best-Practices/)
* [WordPress VIP Code Review Checklist](https://vip.wordpress.com/documentation/vip/code-review-what-we-look-for/)

## Internationalization (i18n)

Internationalization is a set of best practices allowing text strings throughout your code to be easily translated into other languages. Internationalization is often abbreviated as i18n (because there are 18 letters between the i and the n).

Although we do not currently actively translate websites, using i18n best practices now will reduce the burden for adding that feature in the future.

WordPress uses the [gettext](http://www.gnu.org/software/gettext/) libraries and tools for i18n. You can easily identify gettext functions by the `_` at the beginning of the function. WordPress uses WordPress specific variations of these functions, which are detailed below.

### Text Domains
Each project should have a consistent text domain. The text domain is a unique identifier, which makes sure WordPress can distinguish between all loaded translations. This increases portability and plays better with already existing WordPress tools.

If you are developing a plugin, the text domain must match the slug of the plugin. If your plugin is a single file called my-plugin.php or it is contained in a folder called my-plugin the domain name should be my-plugin. The text domain name must use dashes and not underscores.

For this guide's examples, we will use a `bu-bp` (BU Best Practice) text domain.

**DO NOT use variables for text domain.**

`gettext` is not a PHP parser. It can not read variables and constants. Using a variable will result in complications.

###Translating Basic Strings

The most commonly used translation function is `__()`.

`$translated_text = __( 'A string to translate', 'bu-bp' );`

Another basic option is `_e()`. This functions the same as `__()`, with the exception of the result being printed to the screen.

```
// These two examples are exactly the same.
echo __( 'Another string to translate', 'bu-bp' );

// But use this instead.
_e( 'Another string to translate', 'bu-bp' );
```

Other functions exist performing additional formatting to translated content. A few examples:

* [`esc_attr_e()`](https://codex.wordpress.org/Function_Reference/esc_attr_e) and [`esc_attr__()`](https://codex.wordpress.org/Function_Reference/esc_attr__): Translates a string and escapes it for use in an attribute.
* [`esc_html_e()`](https://codex.wordpress.org/Function_Reference/esc_html_e) and [`esc_html__()`](https://codex.wordpress.org/Function_Reference/esc_html__): Translates a string and escapes any HTML within it.

It is best to use the above examples as sanitization is also required for standards.

###Variables

Variables should never be passed in translations.

```
// Wrong
$string = __( $some_string, 'bu-bp' );
```
Translation relies on looking up strings in a table and then translating them. However, this list is built by code that scans your PHP files in an automated process. But because the PHP is not being loaded and files are not being executed, there would be no way to actually translate this variable.

Use [`printf()`](http://php.net/manual/en/function.printf.php) and [`sprintf()`](http://php.net/manual/en/function.sprintf.php) instead. These functions allow you to pass variables into a translated string later using placeholders.

```
print_f(
	__( 'Your BU email is %s.', 'bu-bp' ),
	$email
);
```

This will supply "Your BU email is" to translators, but allows you to pass the email as a string to the result later when the variable has a value.

For more on i18n, please look through the following resources:

* [Plugin Internationalization - WordPress Plugin Handbook](https://developer.wordpress.org/plugins/internationalization/)
* [How to Internationalize Your Plugin - WordPress Plugin Handbook](https://developer.wordpress.org/plugins/internationalization/how-to-internationalize-your-plugin/)
* [Translation FAQ's](https://make.wordpress.org/meta/handbook/documentation/translations/#faq)
* [Internationalization: You’re probably doing it wrong - Otto on WordPress](http://ottopress.com/2012/internationalization-youre-probably-doing-it-wrong/)
* [More Internationalization Fun - Otto on WordPress](http://ottopress.com/2012/more-internationalization-fun/)
* [Translating WordPress Plugins and Themes: Don't Get Clever - Mark Jaquith](https://markjaquith.wordpress.com/2011/10/06/translating-wordpress-plugins-and-themes-dont-get-clever/)
