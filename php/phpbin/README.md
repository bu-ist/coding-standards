# PHPbin Coding Standards & Best Practices

Below is a collection of PHPbin best practices that should be followed in **all code**.

Unlike BU WordPress where we've maintained a standard and used the WordPress code style as our main guide, phpbin has gone on for years with no formal default standard. That has led to our phpbin codebase varying, sometimes drastically and wildly.

We decided to standardize using the WordPress coding standards as a baseline so that all our PHP codebase mostly follows the same standard.

## Exceptions to WP standards

1. Don't mandate use of snake_case in variables and methods.

Many phpbin applications have informally followed using camelCase for methods. Variables often were written in camelCase as well but not as consistently followed. We don't dictate whether to use snake_case nor camelCase but for adding to existing code, follow precedence for consistency. Setting a standard for new code will be addressed in a future PR.

1. Disable sniffing for nonces and WP database wrappers.

The WP standards require using nonces in forms, using the WP database wrapper instead of PDO and using WP wrapper methods around native PHP functions such as `json_encode`. Non-WP code doesn't have access to WP-only code and shouldn't be sniffed.

This is a Work In Progress effort to apply a default standard to all PHPbin applications. As it is a WIP, you may find a PHP application that wildly differs from our default standard, for instance BUniverse was built on Zend Framework. Use your best judgement on whether an application without formal standards should follow these standards or not.

There are two phpcs.xml files in this repo. One is the default standard and the other accodomates applications which have used snake_case for many years and are not worth updating to camelCase.

**Please ensure you apply any changes to both rulesets.**

## Code sniffing

This repo comes with a `phpcs.xml` file for sniffing. Include this file as the baseline in any application without sniffing.

A helpful tip is to run `phpcs` with the `-s` flag. This will show you the name of the sniff causing a reported error/issue. If a clear-cut WP-only sniff is being applied submit a PR to exclude that sniff from our base phpcs.xml file.

Because there are other, well maintained best practice manuals available, this guide is meant to supplement them with summaries of the most important items with some internal context.

### Composer

This repo also comes with a `composer-phpbin.json` file. If the app you're working on does not use composer, add this file as `composer.json` into the app and run `composer install` to install PHPCodeSniffer, WordPress coding standards and PHP 5.3 Compatability sniffs.

To sniff all PHP files:

```bash
./vendor/bin/phpcs *.php
```

Those guides are:

* [WordPress Coding Standards PHP_CodeSniffer](https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards)
