#! /bin/bash -e

echo "submodule init"
git submodule foreach --recursive git submodule init

echo "submodule update"
git submodule foreach --recursive git submodule update

(
    while read submodule branch; do
        echo updating $submodule to branch $branch
        ( cd "$submodule" && git fetch origin && git checkout "$branch"  && git merge "origin/$branch" )
        echo done
    done 
) <.submodule-branches

