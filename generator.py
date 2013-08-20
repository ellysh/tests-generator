#!/usr/bin/env python

import sys

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
    #FIXME: The template file must be script's argument
    read_template('templates/bug/overflow')
    append_params()

    #FIXME: The output file must be script's argument
    write_result('result.c')


if __name__ == '__main__':
    main()
