# my_script.R
#
# DESCRIPTION:
#
# INPUTS:
#
# EXAMPLE:

library(optparse)
source("my_private_lib/my_funs.R")

# --- Import CLI --- #
# args <- commandArgs(trailingOnly = TRUE)

# my_name   <- args[1]
# my_age    <- args[2]
# my_number <- args[3]

my_options <- list(
    make_option(
        c("-n", "--name"),
        default = "Xavier",
        help    = "the name of the guy we are talking about",
        type    = "character" 
    ),
    make_option(
        c("-a", "--age"),
        default = NULL,
        help    = "the age of the guy we are talking about",
        type    = "numeric" 
    ),
    make_option(
        c("--number"),
        default = NULL,
        help    = "the favourite number of the guy we are talking about",
        type    = "character" 
    )
)

# --- Create Functions --- #
print_name <- function(name) {
    print(paste("Hello", name, sep = " "))
}

print_age <- function(name, age){
    print(paste(name, "'s age:", age, sep = " "))
}

print_number <- function(name, number){
    print(paste(name, "'s favourite number is:", number, sep = " "))
}

main <- function(){
    # parse options 
    opt_parser <- OptionParser(option_list = my_options)
    opt        <- parse_args(opt_parser)

    if(is.null(opt$age)){
        #print_help(opt_parser)
        stop("age must be provided")
    }
    if(is.null(opt$number)){
        #print_help(opt_parser)
        stop("favourite number must be provided")
    }
    # do stuff
    print_name(name = opt$name)
    print_age(name = opt$name, age = opt$age)
    print_number(name = opt$name, number = opt$number)
    my_rand_integer(seed = 42, min = 1, max = 100)
}

# --- Run Stuff --- #
main()