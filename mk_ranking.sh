#!/bin/bash

cat title.txt \
  | mecab \
  | grep -v EOS \
  | grep 名詞 \
  | cut -f 1 \
  | sort \
  | uniq -dc \
  | sort -rnk1 > ranking.txt
