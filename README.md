# EC2.201 VLSI Design course project
## Overview
This repository contains the complete VLSI design and implementation of a 5-bit Carry Look-Ahead Adder developed as part of the VLSI Design course (Monsoon 2025 Semester) at IIIT Hyderabad.

The design features a fully custom implementation using TSPC flip-flops for input/output synchronization and has been verified through schematic simulation, post-layout extraction, and FPGA hardware implementation.

## Key Features
- **Technology:** TSMC 180nm with VDD = 1.8V
- **Architecture:** 5-bit CLA with 16 registered D Flip-Flops (10 input + 5 sum + 1 carry)
- **Verification:**
  - **NGSPICE:** Pre-layout and post-layout simulation
  - **MAGIC:** Full custom layout and parasitic extraction
  - **Verilog:** Functional verification on EDA Playground
  - **FPGA:** Hardware validation using Xilinx Spartan-7 board

## Design Highlights
- CMOS implementation of logic gates (NOT, NAND2, NAND3, OR)
- Pass Transistor Logic (CPTL) implementation of XOR gate
- TSPC flip-flops for high-speed single-phase clocking
- NAND-based carry logic using De Morgan's simplification for minimal delay
- Hierarchical P/G block for parallel carry computation
- Three metal layers for all interconnections with global VDD/GND rails

## Timing Parameters (TSPC Flip-Flop)
| Parameter | Value |
|---|---|
| Setup Time | 57 ps |
| Hold Time | 36 ps |
| Clock-to-Q (tCQ) | 39 ps |

## Performance
| Property | Pre-layout | Post-layout |
|---|---|---|
| Max. Frequency | 1 GHz | 2.5 GHz |
| Max. Propagation Delay (tPD) | 234 ps | 70 ps |

## Gate Implementation
| Gate Type | Method | Wn | Wp |
|---|---|---|---|
| D-Flip Flop | TSPC | 10λ | 10λ |
| NAND2 | CMOS | 10λ | 10λ |
| NAND3 | CMOS | 10λ | 10λ |
| OR | CMOS (NOR+INV) | 10λ | 10λ |
| XOR | Pass Transistor Logic | 10λ | 10λ |
| Inverter | CMOS | 10λ | 10λ |

## Floorplan & Layout
| Structure | Hor. Pitch | Vertical Pitch |
|---|---|---|
| TSPC FF | 129λ | 87λ |
| P/G block with 2 FF | 261λ | 182λ |
| XOR gate | 105λ | 112λ |
| C2 | 85λ | 93λ |
| C3 | 112λ | 141λ |
| C4 | 206λ | 117λ |
| C5 | 210λ | 236λ |
| **Complete CLA** | **688λ** | **938λ** |

## Software Tools Used
- **Simulation:** NGSPICE
- **Layout & Extraction:** MAGIC Layout
- **HDL Verification:** Icarus Verilog / EDA Playground
- **FPGA Synthesis:** Xilinx Vivado (Spartan-7)

## Repository Structure
5-bit-carry-look-adder/
├── NGSPICE/          # Pre-layout and post-layout netlists
├── MAGIC/            # Layout and extraction files
├── Verilog/          # HDL description and testbenches
├── Project_Report.pdf
└── README.md

## Author
**Praveen V**  
Roll Number: 2024102019  
B.Tech Electronics and Communication Engineering  
International Institute of Information Technology, Hyderabad  
Email: praveen.v@students.iiit.ac.in
