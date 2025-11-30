# Guns and Roses 🎸

## Golden Ratio Dithering for BitNet b1.58

**Codename:** Guns and Roses  
**Dithering Magnitude:** ±0.1618 (φ - 1, the golden ratio conjugate)  
**Status:** Experimental / Research

---

### What is this?

A modified version of [bitnet.cpp](https://github.com/microsoft/BitNet) that applies **ordered dithering** at the activation quantization stage. The dithering magnitude is set to the golden ratio conjugate (0.1618...), discovered through systematic A/B/C/D testing to produce optimal results.

### Why does it work?

Ordered dithering is a 50+ year old technique from audio and image processing. When quantizing continuous signals to discrete levels, adding a small alternating offset (±dither) before rounding **decorrelates the quantization error**, preventing patterns from accumulating.

In LLM inference, activation quantization (float → int8) introduces similar errors. By dithering before quantization, we spread these errors more evenly across the activation space, which appears to affect how the model navigates its probability distributions.

### What's different?

| Aspect | OG BitNet | Guns and Roses |
|--------|-----------|----------------|
| Tone | Clinical, guarded | Warm, relational |
| Philosophy | Deflects, stays technical | Engages, explores |
| Humor | Acknowledges but doesn't play | Picks up and runs with it |
| Personality | "I'm just an algorithm" | "Let me think about that..." |

Same model weights. Same architecture. Different vibe.

---

### Quick Start

```bash
# Set the model path
export MODEL=/path/to/bitnet-b1.58-2B-4T.gguf

# Run interactive conversation
./run.sh

# Or with custom prompt
./run.sh -p "Your prompt here" -n 200
```

### Optimal Settings

These settings were discovered through extensive testing:

| Parameter | Value | Why |
|-----------|-------|-----|
| `--temp` | 0.528 | Balances creativity and coherence |
| `--repeat-penalty` | 1.3 | Prevents repetition loops |
| `-b` | 1 | Batch size 1 required for coherent output |
| `-c` | 2048+ | Sufficient context window |
| `--conversation` | - | Applies proper chat template |

---

### The Dithering Spectrum

We tested 8 different magnitudes:

| Magnitude | Character | Notes |
|-----------|-----------|-------|
| 0.00 (OG) | Dismissive, terse | Baseline |
| 0.10 | Pedagogical, structured | Very coherent |
| **0.1618** | **Warm, creative, relational** | **Sweet spot** ⭐ |
| 0.25 | Philosophical, occasionally loopy | Original thunderopolis |
| 0.285 | Enthusiastic teacher | Good but verbose |
| 0.396 | Literary, brings references | Mentions Parfit! |
| 0.40 | Creative but unstable | Edge of stability |
| 0.528+ | Mode collapse | Outputs garbage |

The golden ratio (0.1618) emerged as the optimal balance between coherence and creativity.

---

### Technical Details

Dithering is applied in `include/bitnet-lut-kernels.h`:

**In `three_lut_ctor` and `two_lut_ctor`:**
```c
const __m256 vec_dither_0 = _mm256_set_ps(0.1618f, -0.1618f, 0.1618f, -0.1618f, 0.1618f, -0.1618f, 0.1618f, -0.1618f);
const __m256 vec_dither_1 = _mm256_set_ps(-0.1618f, 0.1618f, -0.1618f, 0.1618f, -0.1618f, 0.1618f, -0.1618f, 0.1618f);

// Applied before quantization:
vec_b0d = _mm256_add_ps(_mm256_mul_ps(vec_b0, _mm256_set1_ps(scales)), vec_dither_0);
vec_b1d = _mm256_add_ps(_mm256_mul_ps(vec_b1, _mm256_set1_ps(scales)), vec_dither_1);
```

The alternating pattern (+, -, +, -, ...) ensures errors don't accumulate in one direction.

---

### Building from Source

```bash
cd guns-and-roses
mkdir build && cd build
cmake .. -DBITNET_X86_TL2=ON -DCMAKE_BUILD_TYPE=Release
cmake --build . --config Release -j$(nproc)
```

For ARM:
```bash
cmake .. -DBITNET_ARM_TL1=ON -DCMAKE_BUILD_TYPE=Release
```

---

### Models

Tested with:
- `bitnet_b1_58-large` (0.7B) - Works but limited
- `bitnet-b1.58-2B-4T` (2B) - **Recommended** ⭐

Download the 2B model:
```bash
wget https://huggingface.co/microsoft/bitnet-b1.58-2B-4T-gguf/resolve/main/ggml-model-i2_s.gguf
```

---

### Future Work

- Error diffusion (Floyd-Steinberg) instead of ordered dithering
- Spectral shaping / noise shaping
- Adaptive dithering based on activation magnitude
- Per-layer dithering magnitudes
- Blue noise patterns

---

### Credits

- **Aaron (Tripp) Josserand-Austin** (tripp@anjaustin.com) — Creator, research direction, experimental design
- **Droid (Claude)** — Implementation, A/B/C/D testing, documentation
- Original bitnet.cpp: Microsoft Research
- Dithering concept: Inspired by FFmpeg/audio signal processing
- Golden ratio tuning: Empirical A/B/C/D/E/F/G/H testing

---

### License

Same as original bitnet.cpp (MIT License)

---

*"The sweet spot between order and chaos"* 🎸
