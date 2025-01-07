# Pizza Pizza

[![GLWTSPL](https://img.shields.io/badge/GLWTS-Public_License-red.svg)](LICENSE)

Pizza Simulation.

## Development Process

1. Clone the repository (or a fork of this repo) and set up local configurations
   (see workflow example's configurations section).

2. Create a new issue for whatever it is you will be working on, or select an
   existing issue from the [issues page](issues/)

3. Assign the issue to yourself, and create a dedicated branch for working on
   that issue using one of the name patterns listed below:

    - fix/\<issue-id\>/\<author\> : Use for fixing issues labled as 'bug'.

    - doc/\<issue-id\>/\<author\> : Use for issues labled as 'documentation'.

    - feat/\<issue-id\>/\<author\> : Use for issues labled as 'enhancement'.

    - maint/\<issue-id\>/\<author\> : Use for issues labled as 'maintnance'.

    - refactor/\<issue-id\>/\<author\> : Use for issues labled as 'refactor'.

## Complete workflow example

The following is a workflow example to set up git and commit changes from a user
called MrDocker working on maman11 assignment.

### Cloning the repository:

```sh
# Cloning the original repository via ssh
git clone git@github.com:ketyvagenfeld/pizza-pizza.git

# Cloning the original repository via http
git clone https://github.com/ketyvagenfeld/pizza-pizza.git

# Cloning a fork of the repository forked by MrDocker via ssh
git clone git@github.com:ketyvagenfeld/pizza-pizza.git

# Cloning a fork of the repository forked by MrDocker via https
git clone https://github.com/ketyvagenfeld/pizza-pizza.git
```

### Setting up local configurations:

```sh
# If you havent done so already, cd into your local repository copy
cd pizza-pizza

# Configure username and email
git config --local user.name "MrPizzaPizza"
git config --local user.email "pizzapizza@69420.com"

# Configure pull and push strategies
git config --local pull.rebase true
git config --local push.followTags true
```

### Setting up a new branch, staging, commiting, and pushing changes to remote

```sh
# Creates a new branch called "assignment/maman11/MrDocker" and set it up to
# track changes from upstream branch origin/main
#
git checkout origin/main -b assignment/maman11/MrDocker

# Staging changes to file1, file2, and file3
#
git add file1 file2 file3

# Alternatively, use the -p or --patch flag to inspect changes in each file and
# interactively choose whether to skip/stage/edit change per-file for all
# changed files
#
git add -p

# Inspect differences between staged changes and the HEAD branch
#
git diff --word-diff-regex=. --color-words --cached

# Commit the changes, use the branch type for the title of your commit message
# followed by a semicolon and a short title to describe the change (up to 50
# characters long) written in imperative mood, i.e. instead of 
# 'fix: added x to y' write 'fix: add x to y'.
#
# This is useful when reviewing commits as each commit provides a brief
# description of what is going to happen after applying its changes.
#
git commit --verbose -s -m "feat: add abstract and concrete branch selection policies"

# Pull with rebase to ensure local changes are up to date with newest changes to
# upstream branch
#
git pull --rebase

# Push the changes to remote repository
#
git push origin HEAD
```

## Additional Resources

### Guidlines for submitting patches and commiting changes

[git/git.git - Submitting Patches](assets/SubmittingPatches.html):
General guidelines for submitting patches and commiting changes from the
original git repository of git (git.git)

### Fix commit and squash

```sh
# make changes for commit 1
#
git add <files>
git commit -s -m "MSG"

# make changes for commit 2
#
git add <files>
git commit -s -m "MSG"

# more changes for commit 1 in a third commit
#
git add <files>

# this will create a special commit message that git autosquash will
# automatically understand
#
# <identify_commit_1> can be the sha of the commit, HEAD^, :/"some text in
# commit 1's commit message"
#
git commit --fixup=<identify_commit_1>  

# open editor with the commits already rearranged and commit 1 + commit 3 ready
# to be squashed together
#
git rebase -i --autosquash 
```

### Git Cheatsheet

<img alt="Git Cheatsheet"
    src="assets/git-cheatsheet.png"
/>
