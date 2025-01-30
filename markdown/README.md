# Markdown

The [Markdown markup language](https://en.wikipedia.org/wiki/Markdown) is designed to be easy to read, write, and understand. It succeeds - and its flexibility is both a benefit and a drawback. Many styles are possible, so formatting can be inconsistent; some constructs don't work well in all parsers and should be avoided.

- [Basic Markdown Syntax](https://www.markdownguide.org/basic-syntax/)

## WordPress Markdown Standards

[WordPress Developer Resources: @wordpress/scripts Documentation](https://developer.wordpress.org/block-editor/reference-guides/packages/packages-scripts/#lint-md-docs)

## Gutenberg Starter Repos

The new Gutenberg starter repos for themes and plugins have several utilities baked in, through `@wordpress/scripts`:

- `npm run lint:md` - It uses [markdownlint](https://github.com/DavidAnson/markdownlint) with the [.markdownlint.json](https://github.com/WordPress/gutenberg/blob/HEAD/packages/scripts/config/.markdownlint.json) configuration. This configuration tunes the linting rules to match WordPress standard, you can override with your own config, see [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli/) for command-line parameters.

## Older Repos

See [markdownlint-cli](https://github.com/igorshubovych/markdownlint-cli/) for installation and usage instructions.

## IDEs

- [VSCode: Markdown Shortcuts](https://marketplace.visualstudio.com/items?itemName=robole.markdown-shortcuts)
