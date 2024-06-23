#!/bin/bash

# Array of commands to run in different tabs
commands=(
    'ls'
    'ls -a'
    'ls -al'
)

# Build final command with all the tabs to launch
set finalCommand=""
for (( i = 0; i < ${#commands[@]}; i++ )); do
    export finalCommand+="--tab -e 'bash -c \"${commands[$i]}\"' "
done

# Run the final command
eval "whoami"