#!/bin/bash

MAXCOUNT=10000
count=1

while [ "$count" -le $MAXCOUNT ]
do
  head -c $RANDOM /dev/urandom > $RANDOM
  count=$((count+1))
  echo $count
done

