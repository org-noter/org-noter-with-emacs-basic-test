#!/usr/bin/bash

here=$(pwd)

cd ../pdf-tools
make clean
make -s

cd ../org-mode
make clean
make autoloads

cd $here
emacs -Q -l speed-test.el &
