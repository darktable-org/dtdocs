---
title: workflow
id: contributing-workflow
weight: 5
---

These instructions assume that you already have a github account and have installed **Git** as well. Make sure that git is in your PATH by executing the command `git` in any terminal or cmd and checking that it doesn't output an error such as "command not found". If you don't have git installed, [follow these instructions](https://git-scm.com/book/en/v2/Getting-Started-Installing-Git).


# Documenting undocumented features

We are particularly interested in documenting closed pull requests that require additions or changes to this manual. Pull requests that require documentation are cataloged with a GitHub label `documentation-pending`.

The high-level steps to do this are:

1. View the list of [Pull Requests that need documentation](https://github.com/darktable-org/darktable/pulls?q=is%3Apr+is%3Aclosed+label%3Adocumentation-pending+).
2. Select a Pull Request where you understand what has changed.
3. Author the change as detailed in the workflow below.
4. When you make the Pull Request, include a link to the pull request from Step 1.

# The documentation workflow

## One-time setup

If you have not already configured git locally, use these two commands to configure your identity before committing:

1. `git config --global user.email "you@example.com"`
2. `git config --global user.name "Your Name"`

And if you have not yet authenticated your local git instance with github, follow the instructions for **GitHub CLI** at https://docs.github.com/en/get-started/getting-started-with-git/caching-your-github-credentials-in-git. This will ensure that you have your keys and credentials set up correctly.

Then you can clone a copy of dtdocs to your computer.

1. Go to `https://github.com/darktable-org/dtdocs`
2. Press the `Fork` button and then the `Create fork` button
3. You will be redirected to a page with your fork of the darktable documentation. Press the `Code` button and copy the link under **HTTPS**.
4. Open a terminal or cmd in your desired directory where the darktable documentation repository will reside. Something like 'C:\Users\YourUser\Documents\' or '/home/youruser/Documents/builds'. Both on windows and macOS/Linux you can use the following command to navigate to your desired directory: `cd C:\Users\YourUser\Documents\` replacing the example directory for yours.
5. Clone the dtdocs repository by executing: `git clone https://github.com/<your username>/dtdocs.git` Change the URL to the one you copied in step 3.
6. Now you have a copy of the dtdocs repository on your PC. Some further setup will follow before you can start editing files.

## Syncing changes

1. Go to your repositories on github and select your darktable fork
2. Press the `Sync fork`
3. Open a terminal or cmd in your darktable repository directory
4. Ensure you have no local pending changes by executing `git status` and then execute `git checkout master` (if you followed this guide for the first time you will already be on master).
5. Execute `git pull` (this ensures your local copy is up to date with your fork on github).

## Branch, edit and create a pull request

1. Open a terminal or cmd in your darktable documentation repository directory
2. Execute `git pull origin master` to get the latest changes from GitHub.
3. Execute `git checkout -b branch-name` change `branch-name` for your desired branch name. This is often related to the work you're doing. For example, for this PR https://github.com/darktable-org/darktable/pull/17589 you could call it `dt-synch-edit-docs`.
4. Do the documentation work
5. Verify your changed files with `git status`. If you have more files modified than the ones you intend to submit, you can do `git restore path/to/file/` to revert your changes.
6. Execute `git add -A`. This will stage all changed files.
7. Execute `git commit -m "Added documentation for yada yada"`. Inside the "" you will put a small message about the work you did
8. Execute `git push --set-upstream origin branch-name` Replace branch-name with the one you picked earlier.
9. Create your pull request by following the instructions below.
10. If you need to make further corrections using the current branch, simply repeat 3-8. For the command in step 3 you can omit `-b` and in step 8 you can just do `git push`.
11. After you are done and your pull request is merged or you are finished with your work for this specific pull request, execute `git checkout master` to return to the master branch. I recommend working on only one branch/pr at a time if you don't know how git works.

## Pull request

1. Go to https://github.com/darktable-org/dtdocs/compare
2. Press `compare across forks`. Select your repository, and then the branch you just worked on.
3. Press `Create Pull Request`
