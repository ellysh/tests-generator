#!/usr/bin/env python

import sys

import parameters as param


TEMPLATE = []
RESULT = []

def read_template(filename):
    global TEMPLATE

    with open(filename, 'r') as in_file:
        TEMPLATE = in_file.readlines()


def append_params():
    global RESULT

    for line in TEMPLATE:

        #FIXME: Avoid this hard coded tokens

        if '{GLOBAL_VARIABLE}' in line:
            line = param.GLOBAL_VARIABLE

        if '{LOCAL_VARIABLE}' in line:
            line = param.LOCAL_VARIABLE

        if '{OBJECT_ALLOCATION}' in line:
            line = param.OBJECT_ALLOCATION

        if '{OBJECT_ACCESS}' in line:
            line = param.OBJECT_ACCESS

        if '{OBJECT_FREE}' in line:
            line = param.OBJECT_FREE

        RESULT.append(line)


def write_result(filename):
    with open(filename, 'w+') as out_file:
        out_file.writelines(RESULT)


def main():
    read_template('template.c')
    append_params()
    write_result('result.c')


if __name__ == '__main__':
    main()
