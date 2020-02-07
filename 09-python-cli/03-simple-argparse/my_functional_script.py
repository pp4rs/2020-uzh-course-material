import sys

# my functions

def cli_unpack(arg_object):
    _, name, age, male = arg_object

    return name, age, male 

def print_name(name):
    print(f'Hello {name}')

def print_age(name, age):
    print(f'{name}s age: {age}')

def print_gender(name, gender):
    print(f'Is {name} a male?: {gender}')

# Run Stuff!
if __name__ == "__main__":

    user_name, user_age, user_male = cli_unpack(sys.argv)
    # print(sys.argv)
    # user_name, user_age, user_male = cli_unpack()
    # user_name = sys.argv[1]
    # user_age  = sys.argv[2]
    # user_male = sys.argv[3]

    print_name(name = user_name)
    print_age(name = user_name, age = user_age)
    print_gender(name = user_name, gender = user_male)