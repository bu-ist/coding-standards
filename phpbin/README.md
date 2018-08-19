# PHPbin Coding Standards & Best Practices

Below is a collection of PHPbin best practices that should be followed in **all code**.

Unlike BU WordPress where we've maintained a standard and used the WordPress code style as our main guide, phpbin has gone on for years with no formal default standard. That has led to our phpbin codebase varying, sometimes drastically and wildly.

We decided to standardize using the WordPress coding standards as a baseline so that all our PHP codebase mostly follows the same standard. There are a few notable exceptions we apply to the WP standards.

1. Don't mandate use of snake_case in variables and methods.

Many phpbin applications have informally followed using camelCase for methods. Variables often were written in camelCase as well but not as consistently followed. In order to keep the list of fixes to comply with the standard to a smaller subset we exclude the snake_case WP sniffs and don't dictate whether to use snake_case nor camelCase for now although we likely will revisit which standard to follow for at least methods later.

1. Disable sniffing for nonces, WP database wrapper and WP wrappers around native PHP functions.

The WP standards require using nonces in forms, using the WP database wrapper instead of PDO and using WP wrapper methods around native PHP functions such as `json_encode`. These sniffs clearly should not be applied to non-WP code as non-WP code won't have access to WP's nonce nor wrapper methods.

This is a Work In Progress effort to apply a default standard to all PHPbin applications. As it is a WIP, you may find a PHP application that wildly differs from our default standard, for instance BUniverse was built on Zend Framework, in those cases if an exception is not already listed in the repo ask another developer how to proceed.

A helpful tip is to run `phpcs` with the `-s` flag. This will show you the name of the sniff causing a reported error/issue. If a clear-cut WP-only sniff is being applied you can submit a PR to exclude that sniff from our base phpbin coding standard phpcs.xml file.

Because there are other, well maintained best practice manuals available, this guide is meant to supplement them with summaries of the most important items with some internal context.

Those guides are:

* [WordPress Coding Standards PHP_CodeSniffer](https://github.com/WordPress-Coding-Standards/WordPress-Coding-Standards)