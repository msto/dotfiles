#!/usr/bin/env python
# -*- coding: utf-8 -*-
#
# Copyright © %YEAR% %NAME% <%MAIL%>
# Distributed under terms of the %LICENSE% license.

"""
%HERE%
"""

import argparse


def %FILE%():
    pass


def main():
    parser = argparse.ArgumentParser(
        description=__doc__,
        formatter_class=argparse.RawDescriptionHelpFormatter)
    parser.add_argument('arg1')
    args = parser.parse_args()

    %FILE%()


if __name__ == '__main__':
    main()
