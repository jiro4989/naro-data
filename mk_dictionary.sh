#!/bin/bash

cat title.txt \
  | grep -ve Page -e "---" \
  | mecab \
  | grep -v EOS \
  | sort \
  | uniq -dc \
  | sort -rnk1 > dictionary.txt
