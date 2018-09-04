# Changelog

## 2.1.0
- Exclude "WordPress-VIP" subset from code climate's phpcs file.
- Add PHPbin Coding Standards.
- Update the CSS and Sass README.
- Add `bu_` prefix to allowed list of CSS selectors.

## 2.0.4

- Inform the `WordPress.XSS.EscapeOutput` rule of BU functions that properly escape output. `bu_sanitize_banner_subtitle()` and
`bu_banners_get_image()` were added.

## 2.0.3

- Introduce default custom `PHPCS` rulesets for plugins and themes.

## 2.0.2

- Prevent SASSdoc comments from triggering issues.

## 2.0.1

- Convert the `.scss-lint-r-1.x.yml` configuration file to use the proper
 `scss-lint` format. 

## 2.0.0

- This is the first versioned release of our coding standards. Let's start at
 2.0!
- Introduce markdown linting rules for consistency across our repositories.
- Add linting configurations for Code Climate. ([Pull #5](https://github.com/bu-ist/coding-standards/pull/5))
