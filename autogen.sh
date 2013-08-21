#!/bin/bash

OUT_FILE="test.c"

rm $OUT_FILE

. ./concat.sh

./generator.py overflow $OUT_FILE
