#!/bin/bash

echo 'cloning if needed...'
git clone https://github.com/froemero/Outcome-Predictions-and-Confidence-Regulate-Learning.git 2> /dev/null

comby 'for :[body] end' ':[body].file.name: :[body].lines' .m -lang .m -stdout -newline-separated &> for-loop-lines

MAX_LINES_ALLOWED_FOR_LOOP=100

cat for-loop-lines | while read line; do
   SIZE=$(echo -n $line | cut -d' ' -f2-)
   if [ "$SIZE" -gt "$MAX_LINES_ALLOWED_FOR_LOOP" ]; then
       echo "File contains excessively long for-loop (>$MAX_LINES_ALLOWED_FOR_LOOP lines): $line lines"
   fi
done

rm for-loop-lines
