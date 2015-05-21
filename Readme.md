Readme.MD

File loads required library.

Imports training and test sets (X, Y and subject).

Labels columns and converts Y data to readable activities.

Join data sets together with bind commands.

Use grep to find columns with mean and std in their name.

Removes columns from data set to only mean and std columns

Use ddply to summarize by subject and activity label.

Then outputs to file.