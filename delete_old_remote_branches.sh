#!/bin/sh

if [ -z "$1" ]
  then
    echo "This will delete all REMOTE merged branches and stale branches 3 months or later"
    echo "Include argument of 3 or higher for months"
    exit 1
fi

if [ "$1" -lt 3 ]
    then
        echo "Month must be 3 or later"
fi

# Delete merged branches
git branch --remote --merged origin/master | grep -v 'master$' | cut -b 10- | xargs git push origin --delete --dry-run

# Get the list of remotes and check if there have been a commit in the log file
for branch in $(git branch --remote | grep -v 'master$' | cut -b 10-); do
    if [[ "$(git log origin/$branch --since "$1 months ago" | wc -l)" -eq 0 ]]; then
        git push origin --delete $branch --dry-run
    fi
done
