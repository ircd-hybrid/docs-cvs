#!/bin/sh

# Horribly written shell script, pass it the base name of an SGML file
# and it will generate an HTML output file and clean it up

jade -V nochunks -c /usr/local/share/sgml/docbook/dsssl/modular/catalog \
  -c /usr/local/share/sgml/docbook/catalog \
  -c /usr/local/share/sgml/jade/catalog \
  -d /usr/local/share/sgml/docbook/dsssl/modular/html/docbook.dsl \
  -t sgml $1.sgml >$1.html

tidy -m $1.html

# Also generate the text version
links -dump $1.html >$1.txt.tmp

# links will sometimes put in a NUL character into the output, which is
# fine for most UNIX editors and viewers, but some Windows ones puke on
# it.  Just be safe and remove it
tr -d '\000' <$1.txt.tmp >$1.txt
rm $1.txt.tmp
