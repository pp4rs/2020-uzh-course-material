# Shell: Basics

## What to do

1. Hand out Terminal cheat sheet
2. On Slides
3. Hands on

start terminal

* Mac: `cmd+space` type terminal
* linux: `ctrl+alt+t`
* Windows: start `Windows Terminal (Preview)`, open `Ubuntu` session

## Who and Where am I?

1. whoami
2. pwd
3. ls -aF

## How to get help

1. man `command`
2. `command` --help
3. `command` -h

## The file system

### relative and absolute paths:

* **/**: root
  * Windows:
  * Ubuntu root: pin home folder to explorer: `cd`, `explorer.exe ..`, pin `Username` folder to quick access
  * system root: /mnt/c/
* **~**: user folder
* **.**: folder right now
* **..**: parent folder

### Explain how to escape space

* test\\ test
* "test test"

\newpage

## What have we learned?

Getting help:

* **man COMMAND** / **COMMAND --help** / **COMMAND -h**

Commands:

* **pwd**: Where am I?
* **ls**: What is in a folder?
* **cd**: Change directory

Special places:

* **/**: The root (Windows: **/mnt/C**)
* **~**: The home folder
* **.**: The current folder
* **..**: The parent folder

## Exercise: Navigating the file system

1. Go to your root folder
2. Try to find the folder with the documents of the last semester

\newpage

## Make PP4RS and playground folder

- cd
- ls
- mkdir pp4rs
- ls
- cd pp4rs
- mkdir playground

### download course material

- download from:
- unzip
- copy into `pp4rs/playground`

## Break?

## Make Folders:

1. mkdir thesis
  - don't use whitespace
  - don't use ~
  - don't start with `-`
  - use `-`, `_`, `.`, numbers, letters
2. cd thesis
3. mkdir chapters/subchapters
4. mkdir -p chapters/subchapters

## Making Files & Writing in them

1. nano draft
ctrl+x & save
2. touch draft2.md
3. echo "This is the third test" > test3.md
4. echo ls -lha > test3.md
5. echo "This is the third test. Seriously now " >> test3.md
6. code draft4.md

## Fileendings only convention - helps users and the system to know what is expected

code ../colors/yellow.mp3

## Removing Files and Folders

### rm is forever

1. rm draft2.md
2. ls
3. rm -i draft3.md
5. ls
6. rm chapters
6. rm -R chapters

## Moving Files and Folders

### Also for renaming

1. mv thesis/draft thesis/draft1.md
2. ls thesis
3. mv thesis/first-draft.md .
4. ls thesis
5. ls
6. ls first-*.md

## Copy Files and Folders

1. cp blue.txt colors
2. cp blue.txt colors/bluee.txt
3. cp -R colors colors-again

\newpage

## What have we learned?

* **pwd, ls, cd**: Move around
* **mkdir (-p)**: Create a folder
* **touch** / **code** / **echo 'quote' >> file**: Create / overwrite file
* **mv**: Move stuff
* **cp (-R)**: copy stuff
* **rm (-R)**: Delete stuff (forever!)

## Exercise: Make changes in the file system

1. Go to `pp4rs/playground/terminal` (the main folder)
2. delete colors/bluee.txt
3. Guinea pigs and hamsters are rather pets
    * make a new folder called `pets` in the main folder
    * move `guinea-pig.md` & `hamster.md` there from the `animals` folder
4. `colors/yellow.mp3` is a markdown file. Rename it into `yellow.md`
5. `subfolder3` and `subfolder4` belong into `folders`
    * one of them is missing from `folders`. Find out which
    * copy the missing one from the main folder into `folders`
    * remove both `subfolder3` and `subfolder4` from the main folder
6. Write `I'm done` into a file called`done.md` in the main folder without opening VS Code
7. Add into an extra line `Now, I'm really done` without opening VS Code
8. Open `done.md` in VS Code and make sure the last two steps worked

\newpage

## End of Basics
