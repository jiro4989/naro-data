#!/bin/bash

seq 1000 | while read i; do
  echo "# Page $i ----------------------"
  curl -s "https://yomou.syosetu.com/search.php?&order_former=search&order=new&notnizi=1&p=$i" \
    | grep novel_h \
    | sed -E 's@.*<a[^>]+>([^<]+)</a>.*@\1@g'
  ret=$?
  if [ "$ret" -ne 0 ]; then
    echo "Script end. Page number = $i"
    exit 0
  fi
  sleep 2
done | tee title.txt
