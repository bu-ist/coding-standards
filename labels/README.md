# Labels system
Welcome to the GitHub Labels system! This system is maintained by Ashley Kolodziej in Boston University's Interactive Design department, and is open to any repository in our system. By using this labels system, your repository's labels will automatically update whenever a change is made to our labels system in a non-destructive manner, without any additional work on your part.

The system currently supports custom themes, and will soon be expanded to support other project types such as plugins.

## Opt-in to the Custom Themes labeling system
1. **Add support to your repository:** Add your repository name to the GitHub Labels action here and commit the change. https://github.com/bu-ist/coding-standards/blob/main/.github/workflows/sync-labels.yml#L13
2. **Run the labels sync action:** Use the action in this repository to sync labels to your repository (and all others) at any time. This will rename any labels which have been mapped to a particular label, but it will not delete any custom labels you have created.
<img width="1197" alt="Screen Shot 2022-06-20 at 3 01 15 PM" src="https://user-images.githubusercontent.com/1828613/174664366-6d2e52bd-23a0-45a5-a04c-86cdc48717eb.png">

## Quick tips

* Our labeling system is flexible. Add the labels that make sense for your project!
* Use [the standard](#the-design-system) where possible: the standard label, the standard group, the standard color scheme.
* You don't need to tag labels all at once.
* If you aren't sure how to organize something, leave it **unlabeled**. This makes it easy to find and discuss at your next team meeting.

## Our labels

We base our label structure on the fine principles proposed [here](https://medium.com/@dave_lunny/sane-github-labels-c5d2e6004b63). We start with groups of labels for the following:

- **Status:** Can progress be made on this issue right now? Why or why not?
- **Type:** What type of work is this? This is for helping to track what is billable, and when.
- **To Do:** What will someone need to _do_ to accomplish this task? The starter labels are organized by skillset.
- **Priority:** How important is this task? You can choose anything from Critical (prevents launch) to Not Addressing.
- **Needs:** Who are the stakeholders for this task - the people it affects? These are the people that _need_ to be looped in, whether they work on the task, or need to provide feedback on it. 

You can see an example of these labels in practice in the [Responsive Foundation repository](https://github.com/bu-ist/responsive-foundation/issues).

### The design system

<img src="https://xd.adobe.com/embed/6d6129c9-3244-4a4e-96a8-ce925d11275c-3832/">

Each label group has a color scheme and is always prefixed with the group name and a certain emoji that represents that group except for Status, which uses the traffic light colors to quickly communicate whether you can stop, proceed with caution, or go on a task.

![Screen Shot 2020-04-23 at 5 05 39 PM](https://user-images.githubusercontent.com/1828613/80149472-b8c02980-8584-11ea-8038-56bc0184e137.png)

### Why these labels? What about _____?

Not all projects we take on are built the same way. Some will be very complex child themes and plugins. Others might be as simple as custom CSS. These labels represent the common needs all types of projects share, from the very simple to the very complex. Keeping the standard set of labels as simple as possible creates a lower barrier of entry for new folks. It also allows flexibility for the more complex projects to add their own labels. We think these groups will be a good starting point for your individual project needs 95% of the time - and for those edge cases, you can and should add your own labels!
