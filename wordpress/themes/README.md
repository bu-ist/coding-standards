# WordPress Theme Best Practices

## General Guidelines

* Keep your template files clean and lean. Avoid complex PHP logic.
* Avoid duplicating code across templates. If something will be utilized in multiple areas, it should have a well named function for returning the data, or a template file.

## Prevent Fatal Errors
Usage of any functions or classes defined outside of the current theme should always be wrapped in a `function_exists` or `class_exists` conditional to prevent PHP fatal errors in the absence of a plugin.

## Theme Structure

The following is a list of root level theme folders that should exist in every project with a description of its purpose.

###/admin
All admin related JS & CSS resides here.

###/includes
This folder should include files for grouping like functionality, and classes. For example, if you have one metabox registration function, it can live in `functions.php`. When you start adding more, a class or file should be created for grouping purposes.

###/templates
Any page template files reside here.

###/template-parts
Any template part files are grouped in here.

###/css-dev
All SASS files reside here.

###/js-dev