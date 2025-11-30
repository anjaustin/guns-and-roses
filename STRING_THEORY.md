# String Theory 🎸🎻⚡

**A three-stage filter cascade for BitNet b1.58 activation quantization**

*Oscillating × Layered × Trinity*

## What Is This?

String Theory synthesizes three signal processing approaches into a unified system that shapes BitNet inference behavior using fundamental mathematical constants:

- **α (alpha)** = 1/137 ≈ 0.007299 — Fine structure constant
- **7/16** = 0.4375 — Floyd-Steinberg diffusion
- **φ (phi)** = 0.618 — Golden ratio

## The Three Stages

```
Raw Quantization Error
         ↓
[Stage 1: OSCILLATING]
  Cycle through α → 7/16 → φ → α → ...
  Creates rhythmic variation in diffusion strength
         ↓
[Stage 2: LAYERED]  
  Weight by position in activation sequence:
  - Early chunks:  α (subtle, exploratory)
  - Middle chunks: 7/16 (stable, grounded)
  - Late chunks:   φ (structured output)
         ↓
[Stage 3: TRINITY]
  Cascade through all three constants
  error × α × 7/16 × φ
         ↓
Final Error Carry → Next Chunk
```

## Why Universal Constants?

Through empirical testing, we discovered that these constants produce distinct "personalities":

| Constant | Effect on Output |
|----------|------------------|
| **α (1/137)** | Epistemic humility, question-refining |
| **7/16** | Stability, academic grounding |
| **φ (0.618)** | Warmth, structured responses |

String Theory combines all three in a dynamic, temporally-varying pattern.

## Building

```bash
mkdir build && cd build
cmake .. -DBITNET_X86_TL2=ON -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release -j$(nproc)
```

## Usage

```bash
export LD_LIBRARY_PATH=./build/3rdparty/llama.cpp/src:./build/3rdparty/llama.cpp/ggml/src
./build/bin/llama-cli -m /path/to/bitnet-model.gguf -p "Your prompt" --temp 0.528
```

## Heritage

String Theory is part of the **dr.dedroid** research project exploring FFmpeg-inspired signal processing techniques for LLM inference:

- **Guns and Roses** 🎸 — Golden ratio dithering (±0.1618)
- **Floyd** — Floyd-Steinberg error diffusion
- **Pink Floyd Roses** 🌹 — Dithering + diffusion hybrid
- **Echoes** 🔊 — Bidirectional serpentine diffusion
- **The Wall** 🧱 — All three techniques combined
- **The Wall α** ⚛️ — Fine structure constant diffusion
- **The Wall φ** 🌀 — Golden ratio diffusion
- **String Theory** 🎻 — Three-stage synthesis cascade

## The Philosophy

> "Iteration is Honor."

This work demonstrates that signal processing techniques from audio/image domains (dithering, error diffusion, serpentine scanning) can meaningfully alter LLM inference behavior — and that fundamental constants of the universe can tune model "personality."

## License

MIT

## Acknowledgments

Built on [Microsoft's BitNet](https://github.com/microsoft/BitNet) and [llama.cpp](https://github.com/ggerganov/llama.cpp).

Inspired by 50+ years of signal processing wisdom, Pink Floyd, and Weird Science.

*"From my heart and from my hand, why don't people understand my intentions?"*
