#!/bin/sh
mkdir -p autogen
for x in /usr/bin/*; do
  echo @echo off > autogen/$(basename $x).bat
  echo bash.exe -c \"$(basename $x) %*\" >> autogen/$(basename $x).bat
done
