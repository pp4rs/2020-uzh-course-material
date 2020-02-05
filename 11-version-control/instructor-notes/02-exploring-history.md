# GIT: Exploring History

## git diff HEAD~x

1. Go back to previous folder
1. Add
   `Mama, just killed a man
   Put a gun against his head
   Pulled my trigger, now he's dead
   Mama, life had just begun
   But now I've gone and thrown it all away
    Mama, ooo
   Didn't mean to make you cry
   If I'm not back again this time tomorrow
   Carry on, carry on, as if nothing really matters`
1. git diff HEAD bohemian.md
1. git diff HEAD~1 bohemian.md
1. git diff HEAD~2 bohemian.md
1. git diff HASH
1. git diff SHORT-HASH

### GIT show

1. git show HEAD bohemian.md
2. git show HEAD~2 bohemian.md

\newpage

## Git checkout: Going back in history

### Before committing

1. Destroy bohemian.md
2. git status
3. git checkout HEAD bohemian.md (restores old version)

### After comitting

1. Destroy bohemian.md
2. git commit -am 'destroyed the rhapshody'
3. git checkout HEAD~1 bohemian.md
4. git commit -am "got the good ol' rhapsody back"

### After comitting: Look, don't touch

1. git checkout HEAD~3
2. Explain what this means
3. git checkout master (newest version)
4. git checkout HEAD~3 bohemian.md OR
5. git checkout HEAD~3 .
6. git commit -am 'reverted bohemian from 3 commits back'

\newpage

## What have we learned

1. **git diff**: see differences made in a commit (in a file)
2. **git show**: see the state (of a file) after a commit
3. **git checkout (`FILENAME`) **: Discard unstaged changes in a file / all files
4. **git checkout `VERSION_ID`**: See how the project was at a point in the past
5. **git checkout master**: Go back to newest version of your project
6. **git checkout `VERSION_ID` `FILE_NAME`/`FOLDER_NAME`**: Go back to old version of a file or folder. Commit to get that version back.

## Excercise

1. Make sure you're on the most recent version of your project.
2. See what changed in your last commit.
3. See what the state of your file was 2 commits ago.
4. You like the state 2 commits ago. Get that version of the file back.
5. Commit to keep this change.
6. Look at your git history. Copy one (SHORT-HASH) you like.
7. Now checkout that HASH w/o a file or folder name.
8. Congrats, your head is detached. Look at the files.
9. Now go back to the most recent version of your project.