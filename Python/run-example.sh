#!/bin/bash

echo 'cloning repo if needed...'
git clone https://github.com/lnccbrown/lans.git 2> /dev/null

echo
echo "========================================================"
echo "=========== Comby just-match output ===================="
echo "========================================================"
echo
comby -config Python-MATCH.toml -f .py -lang .py -omega -stats

echo
echo "========================================================"
echo "=========== Comby diff output with comment ============="
echo "========================================================"
echo
comby -config Python-REWRITE.toml -f .py -lang .py -omega -stats
