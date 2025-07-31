# Low-Power Neural Network with Fine-Grain Supply and Operand Gating

## Table of Contents
- [Project Overview](#project-overview)
- [Background](#background)
- [Methodology](#methodology)
  - [Voltage Scaling](#voltage-scaling)
  - [Operand Gating](#operand-gating)
- [Designs](#designs)
  - [Design 1: Baseline CNN](#design-1-baseline-cnn)
  - [Design 2: 2-Input CNN](#design-2-2-input-cnn)
- [EDA Tool Flow](#eda-tool-flow)
- [Results](#results)
  - [Table I: Baseline CNN Power](#table-i-baseline-cnn-power)
  - [Table II: Design 1 with Low-Power Techniques](#table-ii-design-1-with-low-power-techniques)
- [Discussion](#discussion)
- [Future Work](#future-work)
- [Contributors](#contributors)

---

## Project Overview
This project implements transistor-level low-power techniques on a convolutional neural network (CNN) and analyzes their benefits and drawbacks. We employ **voltage scaling** and **operand gating** to reduce both switching and leakage power, and synthesize Verilog CNN architectures for detailed power consumption analysis :contentReference[oaicite:12]{index=12}.

## Background
Prior work in low-power neural networks includes an open-source GitHub effort converting CNN layers from Python into Verilog. While that project focused on functional translation, it did not address power-efficiency methods; our work builds on its Verilog foundation to integrate voltage scaling and operand gating for energy savings :contentReference[oaicite:13]{index=13}.

## Methodology
We target two complementary techniques:

### Voltage Scaling
Lowering supply voltage linearly reduces power (P = VDD×I). We synthesized designs using two libraries—Sky130nm (1.8 V) and NandGate45nm (1.1 V)—and compared power consumption to quantify the impact of voltage scaling :contentReference[oaicite:14]{index=14}.

### Operand Gating
Selective gating turns off unused datapath portions to cut dynamic and static power. By disabling transistors in idle MAC units, we minimize switching activity and leakage simultaneously :contentReference[oaicite:15]{index=15}.

## Designs

### Design 1: Baseline CNN
A simple CNN for MNIST digit classification, featuring:
- Input Layer (28×28 grayscale images)
- Two convolution + ReLU + max-pool sequences
- Flatten + Fully Connected + Softmax output  
Architecture and layer details are described in Verilog and simulated to verify correctness :contentReference[oaicite:16]{index=16}.

### Design 2: 2-Input CNN
A more complex network processing two inputs—a 128×128 “A” image and an 8×8 pattern—through parallel convolution paths, aggregation (to 121×121), max-pooling (to 60×60), and thresholding/sorting for pattern counting :contentReference[oaicite:17]{index=17}.

## EDA Tool Flow
- **ModelSim**: RTL simulation, functional verification, timing analysis, and waveform debugging.
- **Cadence Genus**: Gate-level synthesis, optimization for performance, area, and power.  
This flow ensures correctness before detailed power analysis :contentReference[oaicite:18]{index=18}.

## Results

### Table I: Baseline CNN Power
| Library           | Nominal Voltage | Leakage Power (W) | Internal Power (W) | Switching Power (W) | **Total Power (W)** |
|-------------------|-----------------|-------------------|--------------------|---------------------|---------------------|
| **NandGate45nm**  | 1.1 V           | 3.09075×10⁻³      | 3.25866×10⁻²       | 2.56389×10⁻²        | **6.13612×10⁻²**    |
| **Sky130nm**      | 1.8 V           | 2.89119×10⁻⁷      | 9.65589×10⁻²       | 5.31801×10⁻²        | **1.49739×10⁻¹**    |

*Table I shows dramatic savings under lower VDD (1.1 V) versus 1.8 V* :contentReference[oaicite:19]{index=19}.

### Table II: Design 1 with Low-Power Techniques
| Library           | Nominal Voltage | Leakage Power (W) | Internal Power (W) | Switching Power (W) | **Total Power (W)** |
|-------------------|-----------------|-------------------|--------------------|---------------------|---------------------|
| **NandGate45nm**  | 1.1 V           | 3.08476×10⁻²      | 3.18092×10⁻²       | 2.52959×10⁻²        | **6.01898×10⁻²**    |
| **Sky130nm**      | 1.8 V           | 4.16858×10⁻⁷      | 1.24431×10⁻¹       | 8.30875×10⁻²        | **2.07519×10⁻¹**    |

*Table II demonstrates additional reductions from operand gating and clock gating* :contentReference[oaicite:20]{index=20}.

## Discussion
Key insights include:
- **Modular Adaptability**: Our RTL changes (bit-width trimming, clock gating) apply cleanly across CNN variants.
- **Real-World Impact**: Techniques translate to energy-efficient hardware for edge/IoT and autonomous vehicles.
- **Design Challenges**: Library mismatches (e.g., Sky130nm for Design 2) and long synthesis times required iteration and workflow optimization :contentReference[oaicite:21]{index=21}.

## Future Work
- **ASIC Integration**: Embed power gating and DVFS in an ASIC flow.
- **Advanced Architectures**: Scale techniques to deeper networks and heterogeneous accelerators.
- **Automation**: Develop scripts to explore VDD vs. power trade-offs systematically :contentReference[oaicite:22]{index=22}.

## Contributors
- Muhammad Ali — muhammad.ali@ufl.edu  
- Hunter Wickman — hwickman@ufl.edu  
- **Stephen Singh** — singhstephen@ufl.com  
- Deep Tandel — dtandel@ufl.edu :contentReference[oaicite:23]{index=23}


