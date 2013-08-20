#!/usr/bin/env python

import sys
import params


TEMPLATES_DIR = 'templates/bug/'

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


def main(template_file, out_file):
    read_template(template_file)
    append_params()

    write_result(out_file)


if __name__ == '__main__':
    if len(sys.argv) >= 3:
        template_file = TEMPLATES_DIR + sys.argv[1]
        out_file = sys.argv[2]
    else:
        print('Usage: generator.py <bug_template_file> <out_file>')
        exit(1)

    main(template_file, out_file)
