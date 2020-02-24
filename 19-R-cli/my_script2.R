# comments here
#
#
#

library(optparse)
library(rjson)

# --- CLI Inputs --- #

my_options <- list(
    make_option(
        c("-p", "--params"),
        default = NULL,
        help = "a json dictionary of parameters",
        type = "character"
    )
)

# --- Functions --- #
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
    opt_parser <- OptionParser(option_list = my_options)
    opt <- parse_args(opt_parser)

    if(is.null(opt$params)){
        stop("MUST provide a json file with parameters")
    }

    my_dict <- fromJSON(file = opt$params)

    print_name(my_dict$MY_NAME)
    print_age(my_dict$MY_NAME, my_dict$MY_AGE)
    print_number(my_dict$MY_NAME, my_dict$MY_NUMBER)
}

# --- Run Stuff -- #
main()