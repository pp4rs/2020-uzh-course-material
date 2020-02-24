my_rand_integer <- function(seed, min, max){
    set.seed(seed)

    rand_int <- sample(min:max, 1)
    
    return(rand_int)
}

# only functions in here!