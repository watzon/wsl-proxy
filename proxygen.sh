#!/bin/sh
mkdir -p autogen

generate_proxy() {
    PROGRAMNAME=$(basename $1)
    FULLPATH=$(which $1)
    echo @echo off > autogen/$PROGRAMNAME.bat
    echo bash.exe -c \"${FULLPATH:-$1} %*\" >> autogen/$PROGRAMNAME.bat
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
