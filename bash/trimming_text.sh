#!/bin/bash

myvar="Text Processing Demo"
echo "Value: [$myvar]"

# the -e means process \n as a new line
echo -e "\nxargs"
padded="   This is interesting    "
echo "Before: [$padded]"
echo "After: [$(echo $padded | xargs)]" # I do not like this as it is not the intended use of xargs

echo -e "\nxargs with newline"
padded=$'   Line One\nLine Two    '
echo "Before: [$padded]"
echo "After: [$(echo $padded | xargs)]"

# the -d of tr means delete characters
echo -e "\ntr"
padded=$'   Line One\nLine Two    '
echo "Before: [$padded]"
echo "After: [$(echo $padded | tr -d '\n')]"
# tr can delete multiple characters at once
padded=$'   "Line One, Line Two"    '
echo "Before: [$padded]"
echo "After: [$(echo $padded | tr -d ' ",')]"

# awk is the most powerful way to process text
echo -e "\nawk with newline"
padded=$'   Line One\nLine Two    '
echo "Before: [$padded]"
echo "After: [$(echo $padded | awk '{print $1, $2 " " $3, $4}')]"
