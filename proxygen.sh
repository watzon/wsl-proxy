#!/bin/sh
mkdir -p autogen

generate_proxy() {
    PROGRAMNAME=$(basename $1)
    FULLPATH=$(which $1)
    if [ -z "$FULLPATH" ]; then
      >&2 echo Warning: \"$1\" not found \(creating proxy anyway\)
    fi 

    echo @echo off > autogen/$PROGRAMNAME.bat
    echo bash.exe -c \"${FULLPATH:-$1} %*\" >> autogen/$PROGRAMNAME.bat
    #>&2 echo Created proxy for \"${FULLPATH:-$1}\" in autogen/$PROGRAMNAME.bat
}

if [ $# -eq 0 ]; then
  echo Enter program names separated by spaces or newlines - e.g. gcc, "/usr/bin/*"
  echo Press CTRL-D when done
  while read line
  do
    for programname in $line; do
      generate_proxy "$programname"
    done
  done
else
  for programname in $*; do
    generate_proxy "$programname"
  done
fi
