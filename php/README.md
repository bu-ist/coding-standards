# PHP

## WordPress PHP Coding Standards

The [WordPress PHP Coding Standards](https://developer.wordpress.org/coding-standards/wordpress-coding-standards/php/) are not just about code style, but also encompass established best practices regarding interoperability, translatability, and security in the WordPress ecosystem, so, even when using a different code style, we recommend you still adhere to the WordPress Coding Standards in regard to these best practices.

## Gutenberg Starter Repos

The new Gutenberg starter repos for themes and plugins have `PHPCS` baked in:

- `npm run lint:php` - Lints all modified .php files.
- `npm run lint:php:all` - Lints all .php files.

## Older Repos

[Responsive Framework specific documentation](https://github.com/bu-ist/responsive-framework/wiki/Code-reviews#php)

1. To add this functionality to an older repo, copy the files from `/php/phpcs/` into your repo:

- `repo_root/dev/phpcs`
- `repo_root/.phpcs.xml.dist`
- `repo_root/composer.json`

2. Add these [scripts](https://github.com/bu-ist/responsive-child-starter-3x-block-editor/blob/cc7d67ce9a5ef42cd0a119bd2d6831f11810548e/package.json#L74-L75) into your `package.json` file.
3. You will need to have [Composer](https://getcomposer.org/download/) installed on your computer for the next step. In the terminal run `composer install`. After it installs, you can run the commands outlined in the Gutenberg Starter Repos section.

## IDEs

- [VS Code PHP_CodeSniffer Extension](https://marketplace.visualstudio.com/items?itemName=obliviousharmony.vscode-php-codesniffer)

## Documentation

All files should be documented using [PHPDoc](https://docs.phpdoc.org/guide/getting-started/what-is-a-docblock.html#what-is-a-docblock). In PHPDoc, a DocBlock is a piece of documentation in your source code that informs you what the function of a certain class, method or other Structural Element is.

Process documentation can be added to our GitHub or WP-Docs pages.
