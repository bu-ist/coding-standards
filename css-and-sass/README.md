# CSS

## WordPress PHP Coding Standards

The [WordPress CSS Coding Standards](https://developer.wordpress.org/coding-standards/wordpress-coding-standards/css/) are a baseline for collaboration and review within various aspects of the WordPress open source project and community, from core code to themes to plugins. Files within a project should appear as though created by a single entity. Above all else, create code that is readable, meaningful, consistent, and beautiful.

## Gutenberg Starter Repos

The new Gutenberg starter repos for themes and plugins have several utilities baked in, through `@wordpress/scripts`, which comes pre-configured with tools like ESLint and Prettier.

The available scripts are:

- `npm run lint:css` - Helps enforce coding style guidelines for your style files.

### Settings

- **Prettier**: Prettier automatically formats your code. It uses [stylelint](https://github.com/stylelint/stylelint) with the [@wordpress/stylelint-config](https://www.npmjs.com/package/@wordpress/stylelint-config) configuration. You can override them with your own rules as [described in stylelint user guide](https://stylelint.io/user-guide/configure/).

Overall, we should avoid modifying these configuration files from one project to another, as we frequently resuse code from project to project.

## Older Repos

[Responsive Framework specific documentation](https://github.com/bu-ist/responsive-framework/wiki/Code-reviews#sass)

Alternatively, you can individually include the WordPress config files for Prettier by following these instructions:

- [WordPress Prettier shareable config for Prettier](https://developer.wordpress.org/block-editor/reference-guides/packages/packages-prettier-config/)
