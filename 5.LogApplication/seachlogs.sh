#!/bin/bash
# Find string in files of given directory (recursively)

read -p "Enter search string: " text
read -p "Enter directory: " directory

#arr=( $(find $directory -type f -exec grep -l "$text" {} \; | sort -r) )
#find $directory -type f -exec grep -qe "$text" {} \; -exec bash -c '

file=$(find $directory -type f -exec grep -qe "$text" {} \; -exec bash -c 'select f; do echo $f; break; done' find-sh {} +;)

if [ -z "$file" ]; then
    echo "No matches found."
else
    echo "select tool:"
    tools=("nano" "less" "vim" "quit")
    select tool in "${tools[@]}"
    do
        case $tool in
            "quit")
                break
                ;;
            *)
                $tool $file
                break
                ;;
        esac
    done
fi