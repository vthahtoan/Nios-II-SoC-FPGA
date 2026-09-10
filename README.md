# Direct Digital Synthesizer (DDS) System on Nios II SoC

## Overview
This project presents a hardware-software co-design of a Direct Digital Synthesizer (DDS) implemented on an Altera Cyclone II FPGA (EP2C35F672C6). The system generates continuous analog waveforms, including Square, Triangle, Sine, and Cosine, by leveraging a custom digital logic circuit integrated with a Nios II embedded processor. 

## Key Features
*   **Flexible IP Core Design:** The Custom IP supports two methods for Phase-to-Amplitude conversion:
    *   **LUT (Look-Up Table):** Utilizes Block RAM for fast, 1-2 clock cycle latency.
    *   **CORDIC Algorithm:** An 8-stage pipeline architecture that computes trigonometric functions using only adders and shifters, consuming 0 bits of RAM.
*   **Avalon-MM Interface:** Seamless communication between the Nios II master and the custom DDS IP slave through the Avalon Switch Fabric.
*   **High Performance:** Achieved a maximum operating frequency (Fmax) of 208.68 MHz (CORDIC) and 195.85 MHz (LUT).
*   **Bare-metal C Software:** The Nios II processor dynamically controls the output frequency (phase increment) and wave type via low-level register manipulation.

## Repository Structure
<!-- HUONG DAN: Ban co the sua ten cac thu muc duoi day cho khop voi cay thu muc thuc te -->
    ├── doc/                 # Presentation slides, block diagrams, and waveform images
    ├── rtl/                 # Verilog HDL source files and Qsys system design
    ├── tb/                  # Testbench files for ModelSim verification
    ├── sw/                  # Embedded C code (Eclipse SBT) and BSP settings
    └── README.md

## System Architecture
The SoC architecture consists of a Nios II Processor, On-chip Memory, JTAG UART, and the custom wave_gen_avalon IP, all interconnected via the Avalon bus.

## Implementation Results & Comparison
The design was highly optimized for both logic utilization and speed. Compared to reference papers, this implementation achieves superior performance:

| Parameter | LUT Design | CORDIC Design |
| :--- | :--- | :--- |
| **Max Frequency (Fmax)** | 195.85 MHz | 208.68 MHz |
| **Block RAM usage** | ~ 0.111 BRAM | ~ 0.003 BRAM |
| **Total Equivalent Area** | 1582.5 | 2275.496 |

## Verification
The system functionality was strictly verified using:
1.  **ModelSim:** RTL waveform simulation for all wave types.
2.  **SignalTap II Logic Analyzer:** Real-time on-chip debugging to capture physical signals on the DE2 board.

## Author
*   **Toàn Trọng** - *Computer Engineering, UIT*
