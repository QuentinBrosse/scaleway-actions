#!/bin/sh

set -e

echo
echo
echo "### Environment"
echo
echo
env | sort -f
echo
echo
echo "### $GITHUB_EVENT_PATH"
jq . < "$GITHUB_EVENT_PATH"
echo
echo

# Run any sh commands passed
for cmd in "$@"; do
    echo "Running '$cmd'..."
    if sh -c "$cmd"; then
        echo "Successfully ran '$cmd'"
    else
        exit_code=$?
        echo "Failure running '$cmd', exited with $exit_code"
        exit $exit_code
    fi
done
