#!/bin/bash

ROOT_DIR=".."
TEMPLATE_DIR="$(ls $ROOT_DIR/templates)"

for TEMPLATE in $TEMPLATE_DIR
do
    ./autogen.sh "$TEMPLATE"
done
