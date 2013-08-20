#!/usr/bin/env python

import sys

#FIXME: File with parameters is the script's argument
import params


TEMPLATE = []
RESULT = []

def read_template(filename):
    global TEMPLATE

    with open(filename, 'r') as in_file:
        TEMPLATE = in_file.readlines()


def append_params():
    global RESULT

    for line in TEMPLATE:

        if '@>' in line:
            variable = line.replace('@>', '')
            variable = variable.strip()

            if variable in params.__dict__:
                line = eval('params.' + variable)

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
