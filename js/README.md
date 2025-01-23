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

- **ESLint**: ESLint ensures your JavaScript adheres to best practices and the WordPress coding standards. You can put your ESLint project configuration in a [configuration file](https://eslint.org/docs/latest/use/configure/configuration-files). You can include built-in rules, how you want them enforced, plugins with custom rules, shareable configurations, which files you want rules to apply to, and more.
- **Prettier**: Prettier automatically formats your code. Prettier intentionally doesn’t support any kind of global configuration, but can be configured using a [configuration file](https://prettier.io/docs/en/configuration).

Overall, we should avoid modifying these configuration files from one project to another, as we frequently resuse code from project to project.

## Older Repos

@todo

## IDEs

@todo
https://jsdoc.app/about-getting-started
JSHint
