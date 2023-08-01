#!/usr/bin/env bash
# Test 4-repetition_token_3
# Should print only tests that pass

file='../4-repetition_token_3.rb'

test=(
    hbn
    hbon
    hbtn
    hbtttn
    hbttttn
    hbtttttn
    hbtbtbtbtn
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
