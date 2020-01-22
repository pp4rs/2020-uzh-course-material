# Programming Practices for Research in Economics: Foundations

## Meta-Information

* Course Instructors:
  * Lachlan Deer (@lachlandeer)
  * Matteo Courthoud (matteocourthoud)
  * Ulrich Bergmann (@bergmul)

*   Course Syllabus: [click here](pp4rs-syllabus.pdf)

## Important Links:

* Course website:
    * [`pp4rs.github.io/2020-uzh`](https://pp4rs.github.io/2020-uzh)
* Installation Guide:
    * [`pp4rs.github.io/installation-guide`](https://pp4rs.github.io/installation-guide)
* Course Chatter:
    * [`pp4rs.slack.com/`](pp4rs.slack.com/)
* GitHub repositories
    * [`github.com/pp4rs`](https://github.com/pp4rs)

## Accessing the Course Materials for the First Time

This repository will be updated frequently.
Here are the necessary instructions so that you have your own copy, and it directly plugs in to ours, so you can get updates as needed:

1. Fork this repository by clicking `Fork` on the Github page
    * This gives you your own copy of the repository on GitHub
2. Clone your copy of the repository, by entering the following commands into a terminal after navigating to a folder that you want the materials to live inside:
    ```bash
        $ git clone https://github.com/YOURUSERNAME/2020-uzh-material.git
    ```
    * This gives you your own copy of the repository on your computer
3. Connect an `upstream` branch to the pp4rs master repository:
    ```bash
        $ git remote add upstream https://github.com/pp4rs/2020-uzh-material.git
    ```
    * This gives you the ability to connect to the repository where new materials will be added throughout the course

#### A guided example of forking the repository and downloading its contents:

Suppose Lachlan wants to clone the file repository to his own machine.

* First he forks a copy on GitHub.
*  He wants to download the repository to a folder he has called `phd-courses/first-year/` which lives inside his `home` folder.
After opening a terminal on his computer he enters the following commands (after the `$`` sign):
    ```bash
    $ cd phd-courses/first-year
    ~/phd-courses/first-year/$ git clone https://github.com/lachlandeer/2020-uzh-material.git
    ```

*Note:* Notice how there was no whitespace in the filepath `phd-courses\first-year`.
We recommend you also do not have whitespace in your paths, it makes everything less error prone.

## Keeping your Course Materials up to date

When you want try and update your repository with new course material we post, use the following commands:

1. Navigate to the repository's root folder
    ```bash
        ~$ cd path/to/2020-uzh-material
    ```
    * *Note:* be careful and alter the path above to match your filesystem.
1. `Fetch` the new contents from the `upstream` branch
    ```bash
        ~/phd-courses/first-year/2020-uzh-material/$ git fetch upstream
    ```
2. Checkout the current branch, called `master`, of the files on your computer
    ```bash
        ~/phd-courses/first-year/2020-uzh-material/$ git checkout master
    ```
3. Merge the updated materials from `upstream` into master
    ```bash
        ~/phd-courses/first-year/2020-uzh-material/$ git merge upstream/master
    ```

Now you have the most upto date version of the course materials on your computer.


#### A guided example

Suppose Lachlan has come back after lunch and wants to download the materials for the afternoon session.
After turning on his computer and opening a terminal he enters the following commands

```bash
    ~$ cd phd-courses/first-year/2020-uzh-material
    ~/phd-courses/first-year/2020-uzh-material$ git fetch upstream
    ~/phd-courses/first-year/2020-uzh-material$ git checkout master
    ~/phd-courses/first-year/2020-uzh-material$ git merge upstream/master
```

* *Note:* If you get an error message, as a first step ensure that you committed all your files from your last session.


## License

All materials are licensed under a Creative Commons CC-BY-NC-SA license. The license allows you to copy, remix and redistribute any of our publicly available materials, under the condition that you attribute the work (details in the license) and do not make profits from it. More information is available [here](https://pp4rs.github.io/2020-uzh/license/)


## Suggested Citation

The suggested citation for this repository is:

```
Ulrich Bergmann, Matteo Courthoud & Lachlan Deer, 2020, Programming Practices for Research in Economics, University of Zurich
```

<a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/"><img alt="Creative Commons License" style="border-width:0" src="https://i.creativecommons.org/l/by-nc-sa/4.0/88x31.png" /></a><br />

This work is licensed under a <a rel="license" href="http://creativecommons.org/licenses/by-nc-sa/4.0/">Creative Commons Attribution-NonCommercial-ShareAlike 4.0 International License</a>.