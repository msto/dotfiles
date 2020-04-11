#!/bin/bash
#
# %FFILE%
#
# %HERE%
#
# Copyright (C) %YEAR% %NAME% <%MAIL%>
# Distributed under terms of the %LICENSE% license.

usage() {
  cat <<EOF
usage: %FFILE% [-h]

<DESC>

Optional arguments:
  -h        Show this help message and exit.
EOF
}

while getopts ":h" opt; do
  case ${opt} in
    h)
      usage
      exit 0
      ;;
    *)
      echo -e "error: Invalid option \"-${OPTARG}\"\n" 1>&2
      usage
      exit 1
      ;;
  esac
done

shift $((OPTIND - 1))


