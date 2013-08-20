#!/bin/bash

PARAMS_DIR="params"
ACCESS_DIR="$PARAMS_DIR/access"
MEMORY_DIR="$PARAMS_DIR/memory"
#OBJECT_DIR="$PARAMS_DIR/object"

ACCESS_FILES="$ACCESS_DIR/*"
MEMORY_FILES="$MEMORY_DIR/*"

OUTPUT_FILE="params.py"


for ACCESS in $ACCESS_FILES
do
    for MEMORY in $MEMORY_FILES
    do
        cat $MEMORY > $OUTPUT_FILE
        cat $ACCESS >> $OUTPUT_FILE
    done
done
