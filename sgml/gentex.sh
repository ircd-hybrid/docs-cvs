#!/bin/sh
# $Id: gentex.sh,v 1.1 2002/01/30 03:02:53 wcampbel Exp $

# Horribly written shell script, pass it the base name of an SGML file
# and it will generate an HTML output file and clean it up

jade -Vtex-backend -c /usr/local/share/sgml/docbook/dsssl/modular/catalog \
  -c /usr/local/share/sgml/docbook/catalog \
  -c /usr/local/share/sgml/jade/catalog \
  -d /usr/local/share/sgml/docbook/dsssl/modular/print/docbook.dsl \
  -t tex $1.sgml
