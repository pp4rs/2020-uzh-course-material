import numpy.random as npr

def my_random(my_seed):

    npr.seed(my_seed)
    x = npr.randint(0, 10, 1)
    print('Here is a random integer:', x[0])
    