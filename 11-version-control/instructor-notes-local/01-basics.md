# GIT: Basics

## Setup

install code gitlens extension

- cd; code .
- extensions; search gitlens install; reload

## Start

FYI: rm -rf .git

## First commit

1. open project
1. create bohemian.md

    Is this the real life?
    Is this just fantasy?
    Caught in a landslide
    No escape from reality

1. git init
1. git status
1. git add . / bohemian.md
1. git status
1. git commit -m 'Setting up that rhapsody!'
1. git status
1. git log
1. ls (Where are my changes? No clutter!)

\newpage

## Change the file

1. Edit file:

    Open your eyes
    Look up to the skies and see
    I'm just a poor boy, I need no sympathy
    Because I'm easy come, easy go'

1. git diff
1. git commit -m 'Open your eyes!'
1. git status
1. git add .
1. git commit -m 'Open your eyes!'
1. git reset
1. git commit -am 'Open your eyes!'
1. Show <http://swcarpentry.github.io/git-novice/04-changes/index.html>

\newpage

## Staging Details

1. Edit file:

    A little high, little low
    Anyway the wind blows, doesn't really matter to me, to me

1. git add .
1. git diff (nothing)
1. git diff --staged
1. git commit -m 'A little high?'
1. git status
1. git log

\newpage

## What have we learned

1. **git init**: Start tracking files
1. **git status*: What does Git see? (our best friend)
1. **git add `filename` / `.`**: Stage filename / everything
1. **git reset (filename) **: Unstage everything / filename
1. **git commit -m**: Create a snapshot of all staged files
1. **git commit -am**: Stage all files previously added and commit them
1. **git log**: See the commit history
1. **Extra**: Delete `.git` subfolder to start from scratch

## EXERCISE

1. Go to a new folder which is **not** a subfolder of a Git repository
1. Initialize your Git repository
1. Create a new file
1. What does Git say (git status)?
1. Stage the changes
1. What does Git say?
1. Commit them
1. Add some lines to your file and delete others
1. Look at the differences in Git
1. Stage and commit your changes
1. Now change only single words in your file
1. Look at the differences in Git
1. Try `git diff --color-words`
1. What did the last line do?
1. Stage and commit your changes
