#!/bin/sh

# Horribly written shell script, pass it the base name of an SGML file
# and it will generate an HTML output file and clean it up

jade -V nochunks -c /usr/local/share/sgml/docbook/dsssl/modular/catalog \
  -c /usr/local/share/sgml/docbook/catalog \
  -c /usr/local/share/sgml/jade/catalog \
  -d /usr/local/share/sgml/docbook/dsssl/modular/html/docbook.dsl \
  -t sgml $1.sgml >$1.html

tidy -m $1.html
