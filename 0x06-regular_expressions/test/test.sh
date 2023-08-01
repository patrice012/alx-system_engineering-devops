#!/usr/bin/env bash
# Test 2-repetition_token_1
# Should print only tests that pass

# file='./2-repetition_token_1.rb'

function get_task_id() {
    echo "Select the task to test (Enter task_id):"
    read choice
    if [ -z "$choice" ]
    then
        echo "Usage: $0 task_id"
        exit 1
    fi
    echo "$choice"
}

function get_test_file() {
    echo "Enter the test file name:"
    read test_file
    if [ -z "$test_file" ]
    then
        echo "Usage: $0 test_file"
        exit 1
    fi
    echo "$test_file"
}

function run_task() {
    task_id=$(get_task_id)
    file=$(get_test_file)

    if [ -e "$file" ]
    then
        if [ ! -x "$file" ]
        then
            echo "Permission denied for $file"
        else
            while IFS= read -r test
            do
                output=$(ruby "$file" "$test")
                if [ "$output" == "$test" ]
                then
                    echo "$test pass"
                else
                    echo "$test failed"
                fi
            done < "$file"
        fi
    else
        echo "$file does not exist"
    fi
}

run_task
