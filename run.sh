#!/bin/bash
# Guns and Roses - Golden Ratio Dithering (±0.1618) for BitNet b1.58
# Created by Aaron (Tripp) Josserand-Austin & Droid

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

export LD_LIBRARY_PATH="$SCRIPT_DIR/build/3rdparty/llama.cpp/src:$SCRIPT_DIR/build/3rdparty/llama.cpp/ggml/src:$LD_LIBRARY_PATH"

# Default model path - adjust as needed
MODEL="${MODEL:-$SCRIPT_DIR/../models/bitnet-b1.58-2B-4T.gguf}"

# Optimal settings discovered through A/B testing
"$SCRIPT_DIR/build/bin/llama-cli" \
  -m "$MODEL" \
  --conversation \
  --temp 0.528 \
  --repeat-penalty 1.3 \
  -b 1 \
  -c 2048 \
  -t $(nproc) \
  "$@"
