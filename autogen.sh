#!/bin/bash

TESTS_DIR="tests"
TEMPLATES_DIR="templates"
BUG_FILES="$TEMPLATES_DIR/bug/*"
ACCESS_FILES="$TEMPLATES_DIR/access/*"
MEMORY_FILES="$TEMPLATES_DIR/memory/*"
OBJECT_FILES="$TEMPLATES_DIR/object/*"

TEMPLATE_FILE="template"
PARAM_FILE="params.py"


for BUG in $BUG_FILES
do
    for ACCESS in $ACCESS_FILES
    do
        for MEMORY in $MEMORY_FILES
        do
           for OBJECT in $OBJECT_FILES
            do
                OUT_FILE="$(basename "$BUG")"_"$(basename "$ACCESS")"_"$(basename "$MEMORY")"_"$(basename "$OBJECT").c"

                cat "$BUG" > "$TEMPLATE_FILE"

                cat "$MEMORY" > "$PARAM_FILE"
                cat "$ACCESS" >> "$PARAM_FILE"
                cat "$OBJECT" >> "$PARAM_FILE"

                rm $PARAM_FILE"c"
                ./generator.py "$TEMPLATE_FILE" "$TESTS_DIR/$OUT_FILE"
            done
        done
    done
done
