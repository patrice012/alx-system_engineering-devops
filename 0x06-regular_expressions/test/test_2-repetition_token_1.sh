#!/usr/bin/env bash
# Test 2-repetition_token_1
# Should print only tests that pass

file='../2-repetition_token_1.rb'

test=(
    "htn"
    "hbtn"
    "hbbtn"
    "hbbbbtn"
    "hbbbbbtn"
    "hbbbbtbbn"
    "hbtbtbtbtn"
    )

if [ -e "$file" ]
then
    if [ ! -x "$file" ]
    then
        echo "Permission denied for $file"
    else
        for i in "${test[@]}"
        do
            output=$(ruby "$file" "$i")
            if [ "$output" == "$i" ]
            then
                echo "$i pass"
            else
                echo "$i failed"
            fi
        done
    fi
else
    echo "$file does not exist"
fi
