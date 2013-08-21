#!/bin/bash

ROOT_DIR=".."
TESTS_DIR="$ROOT_DIR/tests"
TEMPLATES_DIR="$ROOT_DIR/templates"
BUG_FILES="$TEMPLATES_DIR/bug/*"
ACCESS_FILES="$TEMPLATES_DIR/access/*"
MEMORY_FILES="$TEMPLATES_DIR/memory/*"
OBJECT_FILES="$TEMPLATES_DIR/object/*"

TEMPLATE_FILE="template"
PARAM_FILE="params.py"

BUG=""
MEMORY=""
ACCESS=""
OBJECT=""

copy_template()
{
    cp "$BUG" "$TEMPLATE_FILE"
}

create_param_file()
{
    # Remove params.pyc file
    rm $PARAM_FILE"c"

    cat "$MEMORY" > "$PARAM_FILE"
    cat "$ACCESS" >> "$PARAM_FILE"
    cat "$OBJECT" >> "$PARAM_FILE"
}

get_out_filename()
{
    echo "$(basename "$BUG")"_"$(basename "$ACCESS")"_"$(basename "$MEMORY")"_"$(basename "$OBJECT").c"
}

generate_test()
{
    copy_template

    create_param_file

    OUT_FILE=$(get_out_filename)
    ./generator.py "$TEMPLATE_FILE" "$TESTS_DIR/$OUT_FILE"
}


for BUG_I in $BUG_FILES
do
    for ACCESS_I in $ACCESS_FILES
    do
        for MEMORY_I in $MEMORY_FILES
        do
           for OBJECT_I in $OBJECT_FILES
            do
                BUG="$BUG_I"
                MEMORY="$MEMORY_I"
                ACCESS="$ACCESS_I"
                OBJECT="$OBJECT_I"

                generate_test
            done
        done
    done
done
