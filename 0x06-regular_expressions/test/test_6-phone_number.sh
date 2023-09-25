#!/usr/bin/env bash
# Test 6-phone_number
# Should print only tests that pass

file='../6-phone_number.rb'

test=(
    4155049898
    " 4155049898"
    "415 504 9898"
    "415-504-9898"
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
