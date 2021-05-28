#!/bin/bash
EXERCISES=$(ls -1 ./exercises/practice)

for dir in $EXERCISES
do
    NAME=$dir
    PACKAGE=exercises/practice/$dir/package.wren
    cp ./package.wren $PACKAGE
    sed -i '' -e "s{\"exercism-wren-track\"{\"exercism/$NAME\"{" $PACKAGE
done