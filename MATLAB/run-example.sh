#!/bin/bash

echo 'cloning if needed...'
git clone https://github.com/froemero/Outcome-Predictions-and-Confidence-Regulate-Learning.git 2> /dev/null

#   echo "========================================================"
#   echo "=========== Comby just-match output ===================="
#   echo "========================================================"
#   comby -config MATLAB-MATCH.toml -f .m -lang .generic -omega -stats

#   echo "========================================================"
#   echo "=========== Comby customized report output=============="
#   echo "========================================================"
#   comby -config MATLAB-MATCH.toml -f .m -lang .generic -omega -stats -stdout -newline-separated

#   echo
#   echo "==============================================================="
#   echo "=========== Comby diff output with inline comment ============="
#   echo "==============================================================="
#   comby -config MATLAB-REWRITE.toml -f .m -lang .generic -omega -stats

comby 'for :[body] end' ':[body].file.name: :[body].lines' .m -lang .m -stdout -newline-separated &> for-loop-lines

MAX_LINES_ALLOWED_FOR_LOOP=100

cat for-loop-lines | while read line; do
   SIZE=$(echo -n $line | cut -d' ' -f2-)
   if [ "$SIZE" -gt "$MAX_LINES_ALLOWED_FOR_LOOP" ]; then
       echo "File contains excessively long for-loop (>$MAX_LINES_ALLOWED_FOR_LOOP lines): $line lines"
   fi
done
