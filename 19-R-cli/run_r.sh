
MY_NAME="John"
MY_AGE="26"
MY_NUMBER="123"

# from this
# Rscript my_script.R $MY_NAME $MY_AGE $MY_NUMBER > log_file.txt 2>&1

# to something that is order independent
Rscript my_script.R --name $MY_NAME \
                    --age  $MY_AGE \
                    --number $MY_NUMBER \
                    > log_file.txt 2>&1

# read params from json instead?
Rscript my_script2.R --params params.json \
                     > log_file2.txt 2>&1