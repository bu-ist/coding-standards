# JavaScript

## WordPress JavaScript Coding Standards

The [WordPress JavaScript Coding Standards](https://developer.wordpress.org/coding-standards/wordpress-coding-standards/javascript/) are adapted from the jQuery JavaScript Style Guide.

## Gutenberg Starter Repos

The new Gutenberg starter repos for themes and plugins have several utilities baked in, through `@wordpress/scripts`, which comes pre-configured with tools like ESLint and Prettier.

The available scripts are:

- `npm run format` - Helps to enforce coding style guidelines for your files (enabled by default for JavaScript, JSON, TypeScript, YAML) by formatting source code in a consistent way.
- `npm run lint:js` - Helps enforce coding style guidelines for your JavaScript and TypeScript files.
- `npm run lint:js:fix` - Fixes auto-fixable lint errors.

### Settings

- **ESLint**: ESLint ensures your JavaScript adheres to best practices and the WordPress coding standards. wp-scripts uses the set of recommended rules defined in [@wordpress/eslint-plugin](https://www.npmjs.com/package/@wordpress/eslint-plugin) npm package. You can override default rules with your own as described in [eslint docs](https://eslint.org/docs/latest/use/configure/configuration-files).
- **Prettier**: Prettier automatically formats your code. It uses [stylelint](https://github.com/stylelint/stylelint) with the [@wordpress/stylelint-config](https://www.npmjs.com/package/@wordpress/stylelint-config) configuration. You can override them with your own rules as [described in stylelint user guide](https://stylelint.io/user-guide/configure/).

Overall, we should avoid modifying these configuration files from one project to another, as we frequently resuse code from project to project.

## Older Repos

[Responsive Framework specific documentation](https://github.com/bu-ist/responsive-framework/wiki/Code-reviews#javascript)

Alternatively, you can individually include the WordPress config files for ESLint and Prettier by following these instructions:

- [ESLint plugin including configurations and custom rules for WordPress development](https://developer.wordpress.org/block-editor/reference-guides/packages/packages-eslint-plugin/)
- [WordPress Prettier shareable config for Prettier](https://developer.wordpress.org/block-editor/reference-guides/packages/packages-prettier-config/)

## IDEs

- [VSCode: ESLint](https://marketplace.visualstudio.com/items?itemName=dbaeumer.vscode-eslint)

## Documentation

All files should be documented using [JSDoc](https://jsdoc.app/about-getting-started). You add documentation comments directly to your source code, right alongside the code itself.

Process documentation can be added to our GitHub or WP-Docs pages.
