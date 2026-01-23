---
title: workflow
id: contributing-workflow
weight: 5
---

These instructions assume that you already have a github account and have installed **Git** as well. Make sure that git is in your PATH by executing the command `git` in any terminal or cmd and checking that it doesn't output an error such as "command not found". If you don't have git installed, [follow these instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).

# Authenticate Github

Follow the instructions for **GitHub CLI** at https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git

This will ensure that you have your keys and credentials setup correctly.

# Documenting undocumented features

We are particularly interested in documenting closed pull requests that require new or changes to this manual. Pull requests that require documentation are cataloged with a GitHub label `documentation-pending`.

The high-level steps to do this are:

1. View the list of [Pull Requests that need documentation](https://github.com/darktable-org/darktable/pulls?q=is%3Apr+is%3Aclosed+label%3Adocumentation-pending+).
2. Select a Pull Request where you understand what has changed.
3. Author the change as detailed in the workflow below.
4. When you make the Pull Request, include the a link to the pull request from Step 1.

# The documentation workflow

## One-time setup

Perform the follwing steps once on your computer to preprase it for working with the documentation. If you already have GitHub SSH keys setup, you do not need to set them up again.

1. Go to `https://github.com/darktable-org/dtdocs`
2. Press the `Fork` button and then the `Create fork` button
3. You will be redirected to a page with your fork of darktable documentation. Press the `Code` button and copy the link under **HTTPS**.
4. Open a terminal or cmd in your desired directory where the darktable documentation repository will reside. Something like 'C:\Users\YourUser\Documents\' or '/home/youruser/Documents/builds'. Both on windows and macOS/Linux you can use the following command to travel to your desired directory: `cd C:\Users\YourUser\Documents\` replacing the example directory for yours.
5. Pull the darktable repository by executing: `git clone https://github.com/<your username>/dtdocs.git` Change the URL for the one you copied on step 3.
6. Now you have a copy of the darktable repository on your PC

## Syncing changes

1. Go to your repositories on github and select your darktable fork
2. Press the `Sync fork`
3. Open a terminal or cmd in your darktable repository directory
4. Assure you have no pending changes by executing `git status` and then execute `git checkout master`
5. Execute `git pull`

## Branch and edit

1. Open a terminal or cmd in your darktable documentation  repository directory
2. Execute `git pull origin master` to get the latest changes from GitHub.
3. Execute `git checkout -b branch-name` change `branch-name` for your desired branch name. This is often related to the work you're doing. For example for this PR https://github.com/darktable-org/darktable/pull/17589 you could call it `dt-synch-edit-docs`.
4. Do the documentation work
5. Verify your changed files with `git status`. If you have more files modified than the ones you intend to submit, you can do `git restore path/to/file/` do revert your changes.
6. Execute `git add -a`. This will stage all changed files.
7. Execute `git commit -m "Added documentation for yada yada"`. Inside the "" you will put a small message about the work you did
8. Execute `git push --set-upstream origin branch-name` Changing the branch name by the one you picked before
9. Create your pull request by following the instructions bellow.
10. If you need to make changes, simply repeat 3-7. For the command in step 2 you can omit `-b` and in step 7 you can just do `git push`.
11. After you are done and your pull request is merged or you are finished with your work for this specific pull request, execute `git checkout master` to return to the master branch. I recommend working on only one branch/pr at a time if you don't know how git works.

## Pull request

1. Go to https://github.com/darktable-org/dtdocs/compare
2. Press `compare across forks`. Select your repository, and then the branch you just worked on.
3. Press `Create Pull Request`
