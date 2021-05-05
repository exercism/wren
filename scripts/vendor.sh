#!/bin/bash
EXERCISES=$(ls -1 ./exercises/practice)

cd exercises/practice
for dir in $EXERCISES
do
    echo $dir
    cd $dir
    rm -rf vendor
    ln -s ../../../vendor vendor
    # mkdir vendor
    # cp -R ../../../vendor/* vendor/
    cd ..
done