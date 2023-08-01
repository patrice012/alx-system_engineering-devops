#!/usr/bin/env bash
# Test 2-repetition_token_1.rb
# Should print only tests that pass

file=../'2-repetition_token_1.rb'

test=(
    "htn"
    "hbtn"
    "hbbtn"
    "hbbbbtn"
    "hbtbtbtbtn"
    )

if [ -e "$file" ]
then
    if [ ! -x "$file" ]
    then
        echo "Permission denied for $file";
    else
        for i in "$test"
        do
            echo "$i"
            ./"$file" "$i"
            echo "$i pass"
        done
    fi
else
    echo "$file does not exist"
fi
