# Contributing

All code contributions are welcome! These contribution guidelines will help you
 jump right into writing code for this repository.

## Submitting Code

This repository follows a pull request/peer review workflow. All code submitted
 into `develop` and `master` must be done through a pull request.

The `master` branch can be considered stable, production ready code. A list of
 stable releases is maintained as we go and can be used by anyone concerned with
 ongoing development.

All ongoing development takes place in branches off of `develop` (the primary
branch). This allows you to work on tasks and features in isolation until they
are 100% finished. It also creates a clear record of how the feature
progressed, and the finished state when it was merged into the overall
codebase.

Every effort should be made to make a branch as stable as possible before
merging your branch into `develop` through a pull request.

### `develop` Pull Request Process

When the code in your feature branch is done and ready to be merged, a pull
 request to `develop` should be created.

1. Ensure your local checkout of the repository is up to date.
1. Check out the `develop` branch.
1. Create a new branch for your work.
1. Make as many changes and commits as necessary within your branch.
1. When your code is finished and ready, submit a pull request to merge your
 branch into `develop`.
1. After your pull request receives approval from at least one other team
 member, merge your code into `develop` and ensure the merge went smoothly.
1. After verifying your merge, delete your feature branch.

### Branch Names

Branches can be named anything you want. However, it is very helpful to include
 useful information in branch names, such as:

* GitHub issue numbers.
* Short name of the problem (Ex. adding-thumbnail-support-to-pages).
* Other identifying information.

### Writing Good Code

All pull requests should be peer reviewed by another team member. Please use
 good coding style & best practices.

Except where noted in [our own coding standards repository](https://github.com/bu-ist/coding-standards),
 we follow the [WordPress Coding Standards](https://make.wordpress.org/core/handbook/best-practices/coding-standards/)
 to the best of our abilities. This helps ensure that everyone's coding style
 and methodologies follow the same conventions, allowing our review efforts to
 be focused on the code's effectiveness, performance, and functionality.

Each commit and pull request will automatically be evaluated by [Code Climate](https://codeclimate.com/).
 Code Climate will use these coding standards and best practices to
 automatically evaluate each commit. A Code Climate build will "fail" when new
 issues are introduced within a pull request. While it is not required for your
 pull request to pass the Code Climate build, it is highly encouraged. Our
 codebase should be consistently improving, not regressing.

### Unit Tests

If this repository possesses any unit tests, they are required to pass in order
for a pull request to be merged.

If you are introducing new functions in your pull request, please do your best
to include unit tests validating the functionality of newly added functions.

Unit test suites are a collection of tests and assertions that ensure your code
works as expected. These are usually automatically run through [Travis CI](https://travis-ci.com),
but can also be run locally on any machine.

### Creating Pull Requests

Pull requests should have a meaningful titles and descriptions of the changes
being merged in. This could mean one sentence, or 4 paragraphs. Someone
reviewing your pull request should be able to easily understand what was added
or changed, why, and how you fixed it. Use your best judgement.

When submitting your pull request to `develop`, add a line to `CHANGELOG.md`
explaining your change. This should be placed under the "Unreleased" heading.
There should be at least one changelog entry per pull request.

Any necessary changes to `README.md` files should also be made before making
a pull request.

For anything that needs more explanation, or code examples need to be provided,
link out to a blog post on [Make ID](http://developer.bu.edu/make-id/) or documentation
page on [developer.bu.edu/webteam/](http://developer.bu.edu/webteam/) for more detail.

If one exists, the pull request should link to the GitHub issue (typing # will
bring up an autocomplete dialogue to search through issues). Also, consider
linking the pull request to a [Trello card with the GitHub Power-Up](http://blog.trello.com/github-and-trello-integrate-your-commits).

### Deleting Branches

After successfully merging a branch into the `develop` or `master`, the pulled
 branch should be deleted. Only branches with active development, or unmerged
 code should remain in the repository. The person merging the branch and
 closing out the pull request is responsible for doing this.

## Creating A New Release

Every pull request into `master` should be considered a new release because
`master` always reflects the code that exists on production. The following actions should be performed on every pull request being merged into
`master`.

1. Increment any version number strings.
1. Update the "Unreleased" heading in the `CHANGELOG.md` to reflect the new version
 being prepared for release.
1. Perform any necessary compile or build tasks through Grunt.

### `master` Pull Request Process

When the code in `develop` is ready to be released into the wild, a pull
 request to `master` should be created.

1. Ensure your local checkout of the repository is up to date.
1. Check out the `develop` branch.
1. Create a new branch from `develop` and prepare your release. Take care to
 perform each step listed above under Creating A New Relase.
1. Submit a pull request to merge your branch into `master`.
1. After your pull request receives approval from at least one other team
 member, merge your code into `master` and ensure the merge goes smoothly.
1. Delete your release branch.
1. After verifying your merge and deleting your branch, [create a release
 against master in GitHub](https://help.github.com/articles/creating-releases/)
 for the repository. Release names should match the version released. Ex.
 `1.5.1`, or `1.6`.
1. Create a pull request to merge `master` into `develop` to sync the latest
 release into `develop` for future development.

## Creating A Hot Fix

Sometimes, a fix needs to be deployed to production ASAP. When this happens,
 there is a third flow that should be followed. Because `develop` will have
 code that has not yet been released into the wild (and may not be ready), hot
 fixes should be performed in a branch off of `master`.

### Creating Hot Fix Pull Requests

1. Ensure your local checkout of the repository is up to date.
1. Check out the `master` branch.
1. Create a new branch for your work.
1. Make the necessary code changes and commit.
1. Submit a pull request to merge your branch into `master`.
1. Since this code will be deployed to production, the release steps listed
 above should be followed.
1. Because this code will bypass `develop`, it is important to get at least
 one code review from another team member.
1. After your pull request receives approval, merge your code into `master` and
 ensure the merge went smoothly.
1. Delete your branch.
1. After verifying your merge and deleting your branch, [create a release
 against master in GitHub](https://help.github.com/articles/creating-releases/)
 for the repository. Release names should match the version released. Ex.
 `1.5.1`, or `1.6`.
1. Create a pull request to merge `master` into `develop` to sync the latest
 release into `develop` for future development. Approval is not necessary on
 this pull request.
