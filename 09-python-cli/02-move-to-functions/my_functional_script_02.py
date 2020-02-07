
# my inputs

user_name = "John"
user_age  = 26
user_male = True

# my functions

def print_name(name):
    print(f'Hello {name}')

def print_age(age):
    print(f'Johns age: {age}')

def print_gender(gender):
    print(f'Is John a male?: {gender}')

# Run Stuff!
if __name__ == "__main__":
    print_name(name = user_name)
    print_age(age = user_age)
    print_gender(gender = user_male)