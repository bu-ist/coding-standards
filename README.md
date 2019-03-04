# BU Example Repo

The purpose of this repository is to provide an example of a best practices Git/Github repository. The concepts here are geared towards creating a great Git/Github repo that can be handed off to practically anyone but the concepts can apply to most any piece of code.

## The README is critical

The first thing a user sees when visiting a repository on Github is a listing of files and the README.md file, if present. That makes the README.md part of the first impression anyone has of your repository.

Take a look at this screenshot of an initial commit creating a one-line README.md:

![Bad short uninformative README](http://www.bu.edu/wpmu/files/2019/03/Screen-Shot-2019-03-01-at-10.34.43-AM-650x196.png)

Is that a good introduction for you to the bu-guide-to-git repository? Does it provide you wany information on the goal of the repo, whether it achieved it and whether it's usable or even in use?

Of course not! That README.md just repeats the title of the repo with no additional information.

### README Driven Development

There are advocates of starting any development project by first creating your README.md file. This concept is called [README Driven Development](http://tom.preston-werner.com/2010/08/23/readme-driven-development.html). While we certainly would encourage you to try RDD, it's not necessary to having a great README or a great repo.

However, there are a few basic questions that any good README.md should be able to answer.

### Components of a Great README.md file

Primarily, the README.md file should be a good starting point for a complete stranger figuring out a repo. Does your README answer these questions? If not, before writing another line of code update your README so that these questions are answered.

- What does it do and why does it do it?
- Where is it deployed?
- How are changes deployed?
- Can I run it locally and if so how?
- How to test?
- Oddities ( for instance homepage uses AWS SDK 2 instead of 3 because of PHP5 )
- What configuration items are there | Is there an initial (one-time) setup?
- Are any credentials needed?

If your README can answer all these questions you likely have a great README!

#### Examples of Real READMEs

Below are a few examples of READMEs we think are stellar examples:

[bu-infographics](https://github.com/bu-ist/bu-infographics/blob/develop/README.md)

### Commented Out Code

When making changes to a remote Git repository ( e.g. Github.com ), particularly `master`, or otherwise sharing code:

- [Don't commit commented out code](https://kentcdodds.com/blog/please-dont-commit-commented-out-code).
- [Don't share commented out code](https://www.nayuki.io/page/dont-share-commented-out-code).

Code you're `pushing` or otherwise sharing should not include commented out code. Doing so makes reading your code take longer for no gain. By all means comment out code locally while working out a change but when sharing it by publishing it to github.com it should only contain used code. The only exception is if you're working in branch explictly marked for your personal use, but when merging that branch it should not contain commented out code.
