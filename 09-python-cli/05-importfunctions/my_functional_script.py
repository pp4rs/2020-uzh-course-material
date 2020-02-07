import sys
import argparse
import other_script
from priv_lib import utils
# my functions

def print_name(name):
    print(f'Hello {name}')

def print_age(name, age):
    print(f'{name}s age: {age}')

def print_gender(name, gender):
    print(f'Is {name} a male?: {gender}')

# --- Parse CLI --- #
# ---  Define command line options --- #
# this also generates --help and error handling
CLI = argparse.ArgumentParser()

CLI.add_argument(
"--username",  # name on the CLI - drop the `--` for positional/required parameters
required = False,
default = "John",
help = 'Enter the user name'
#nargs   = "*",  # 0 or more values expected => creates a list
#type    = str,)
)
CLI.add_argument(
"--age",
help = 'Enter User Age',
required = True
#   nargs   = "*",
#   type    = str,  # any type/callable can be used here
#   default = "out/",
)

CLI.add_argument(
"--male",
help = 'Is User a male?',
required = True
#   nargs   = "*",
#   type    = str,  # any type/callable can be used here
#   default = "out/",
)
## Unpack CLI

args        = CLI.parse_args()
user_name   = args.username
user_age    = args.age
user_male   = args.male

# Run Stuff!
if __name__ == "__main__":

    #user_name, user_age, user_male = cli_unpack(sys.argv)
    # print(sys.argv)
    # user_name, user_age, user_male = cli_unpack()
    # user_name = sys.argv[1]
    # user_age  = sys.argv[2]
    # user_male = sys.argv[3]

    print_name(name = user_name)
    print_age(name = user_name, age = user_age)
    print_gender(name = user_name, gender = user_male)
    other_script.favourite_number(name = user_name, number = 42)
    utils.my_random(my_seed = 123)