#!/bin/bash

TEMPLATES_DIR="templates"
ACCESS_DIR="$TEMPLATES_DIR/access"
MEMORY_DIR="$TEMPLATES_DIR/memory"
#OBJECT_DIR="$TEMPLATES_DIR/object"

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
