#!/bin/bash
# Usage:
#   ./update_git_repos.sh [parent_directory] 
#   example usage:
#       ./update_git_repos.sh C:/GitProjects/ [MAKE SURE YOU USE / SLASHES]

updateRepo() {
    local dir="$1"
    local original_dir="$2"
    cd $dir # switch to the git repo
    repo_url=$(git config --get remote.origin.url)

    echo "****************************************************************************"
    echo "Updating Repo: $dir with url: $repo_url"
    echo "Starting update in $PWD"
    echo "****************************************************************************"
    echo $repo_url
    echo "****************************************************************************"
}


directory_to_update=${1}
for dir in $(find $directory_to_update -maxdepth 4 -type d -name .git | xargs -n 1 dirname); do
    updateRepo $dir $directory_to_update #& #uncomment to make it run in multiple threads, meh
    ((count+=1))
done

updateRepo $dir $directory_to_update