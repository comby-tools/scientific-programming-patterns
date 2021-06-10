#!/bin/bash

echo 'cloning if needed...'
git clone https://github.com/froemero/Outcome-Predictions-and-Confidence-Regulate-Learning.git 2> /dev/null

echo "========================================================"
echo "=========== Comby just-match output ===================="
echo "========================================================"
comby -config MATLAB-MATCH.toml -f .m -lang .generic -omega -stats

echo "========================================================"
echo "=========== Comby customized report output=============="
echo "========================================================"
comby -config MATLAB-MATCH.toml -f .m -lang .generic -omega -stats -stdout -newline-separated

echo
echo "==============================================================="
echo "=========== Comby diff output with inline comment ============="
echo "==============================================================="
comby -config MATLAB-REWRITE.toml -f .m -lang .generic -omega -stats
