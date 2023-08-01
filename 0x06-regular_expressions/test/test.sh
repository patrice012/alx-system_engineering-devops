#!/usr/bin/env bash

# Ask the user for the task ID
echo "Enter the task ID:"
read task_id

# Select the correct test file based on the task ID
case $task_id in
    0)
        test_file="test0.txt"
        file='../0-simply_match_school.rb'
        ;;
    1)
        test_file="test1.txt"
        file='../1-repetition_token_0.rb'
        ;;
    2)
        test_file="test2.txt"
        file='../2-repetition_token_1.rb'
        ;;
    3)
        test_file="test3.txt"
        file='../3-repetition_token_2.rb'
        ;;
    4)
        test_file="test4.txt"
        file='../4-repetition_token_3.rb'
        ;;
    5)
        test_file="test5.txt"
        file='../5-beginning_and_end.rb'
        ;;
    6)
        test_file="test6.txt"
        file='../6-phone_number.rb'
        ;;
    7)
        test_file="test7.txt"
        file='../7-OMG_WHY_ARE_YOU_SHOUTING.rb'
        ;;
    # Add more cases for other task IDs and corresponding test files if needed
    *)
        echo "Invalid task ID $task_id"
        exit 1
        ;;
esac


# Check if the test file exists
if [ -e "$test_file" ]
then
    # Execute the test for each entry in the test file
    while IFS= read -r test
    do
        # Run the test and check the output
        output=$(ruby "$file" "$test")
        if [ "$output" == "$test" ]
        then
            echo "$test pass"
        else
            echo "$test failed"
        fi
    done < "$test_file"
else
    echo "$test_file does not exist"
fi
