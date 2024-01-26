#!/bin/bash

i=0
while true
do
  echo "第 ${i} 次尝试访问"
  i=$((i+1))
  curl https://git.babudiu.com/xxx
done
