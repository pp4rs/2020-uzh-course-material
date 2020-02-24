# Introduction to Snakemake

How this lesson progressed:

1. Forked the repo to own account: https://github.com/pp4rs/2020-snakemake-learner.git
2. Cloned own version of repo into playground
3. Then we built up a reproducible workflow iteratively
    * All work was done on the `devel` branch, or on dedicated feature branches `feat/<SOMETHING>` which were later merged to master

Lachlan's own version of the repo is here: https://github.com/lachlandeer/2020-snakemake-learner

I have tagged each of the main topics we covered.

* Everything we did in class is tagged `0.0.X`
* Where we finished class is tagged `1.0.0` and was merged in the the `master` branch
* All tags after `1.0.0` are additional steps you might be interested in for your assignment
  * Each has their own `feat` branch
  * Each was merged only into `devel`
  * This means `master` was where we ended the day, and the `HEAD` of `devel` is an advancement of that which you might be interested in

Here's the tag list so you can see how we progressed:

0.0.1           create simple rules
0.0.2           target rules added
0.0.3           simple wildcards + all rule
0.0.4           double wildcard for instruments
0.0.5           make regression table
0.0.6           generate pdfs
1.0.0           where we finished in class
1.0.1           switch to config files for paths
1.0.2           output sent to log file not screen
1.0.3           create help text and help file
1.0.4           move pdfs to main folder - easier to find
1.0.5           add rules to install packages and software to build project

Importantly:

In class I forgot to cover the double wildcard bit in depth. 
This is why making the regression table broke for many of you in class. 
Check out the state of the `Snakefile` in the tags 0.0.4 and 0.0.5 to see how the code develops.
