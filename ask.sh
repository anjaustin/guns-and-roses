#!/bin/bash
# Ask Guns and Roses a single question
# Usage: ./ask.sh "Your question here"
cd "$(dirname "${BASH_SOURCE[0]}")"
./run.sh -p "<|im_start|>user
$1<|im_end|>
<|im_start|>assistant
" -n 300
