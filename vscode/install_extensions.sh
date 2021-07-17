#!/bin/bash
SCRIPT_DIR=$(cd $(dirname $0) && pwd)

if !(type "code" > /dev/null 2>&1); then
  echo "code command not found"
  exit 1
fi

cat extensions | while read line
do
 code --install-extension $line
done

code --list-extensions > extensions
