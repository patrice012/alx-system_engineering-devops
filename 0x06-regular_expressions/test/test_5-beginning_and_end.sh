#!/usr/bin/env bash
# Test 5-beginning_and_end
# Should print only tests that pass

file='../5-beginning_and_end.rb'

test=(
    hn
    hbn
    hbtn
    h8n
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
