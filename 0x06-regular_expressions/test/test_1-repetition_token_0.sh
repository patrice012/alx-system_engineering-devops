#!/usr/bin/env bash
# Test 1-repetition_token_0
# Should print only tests that pass

file='../1-repetition_token_0.rb'

test=(
    "School"
    "school"
    "Holberton"
)

if [ -e "$file" ]; then
    if [ ! -x "$file" ]; then
        echo "Permission denied for $file"
    else
        for i in "${test[@]}"; do
            output=$(ruby "$file" "$i")
            if [ "$output" == "$i" ]; then
                echo "$i pass"
            else
                echo "$i failed"
            fi
        done
    fi
else
    echo "$file does not exist"
fi
