#!/bin/bash

cat title.txt \
  | mecab \
  | grep -ve EOS -e Page \
  | grep 名詞 \
  | cut -f 1 \
  | sort \
  | uniq -dc \
  | sort -rnk1 > ranking.txt
