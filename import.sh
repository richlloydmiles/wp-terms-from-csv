#/bin/bash
while IFS='' read -r line || [[ -n "$line" ]]; do

output="$(echo ${line} | sed 's/\"//g')"
name="$(echo $output | cut -f1 -d',')"
slug="$(echo $output | cut -f2 -d',')"

wp term create "$2" "${name}" --slug=${slug};

done < "$1"

# call via ./import {csv file} {taxonomy}