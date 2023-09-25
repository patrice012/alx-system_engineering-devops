#!/usr/bin/env bash
# Test 6-phone_number
# Should print only tests that pass

file='../6-phone_number.rb'

test=(
"I realLy hOpe VancouvEr posseSs Yummy Soft vAnilla Dupper Mint Ice Nutella cream"
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
            echo "$output"
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
