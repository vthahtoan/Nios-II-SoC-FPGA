# Direct Digital Synthesizer (DDS) System on Nios II SoC

## 📌 Overview
This project presents a hardware-software co-design of a Direct Digital Synthesizer (DDS) implemented on an Altera Cyclone II FPGA (EP2C35F672C6). The system generates continuous analog waveforms, including Square, Triangle, Sine, and Cosine, by leveraging a custom digital logic circuit integrated with a Nios II embedded processor. 

## ✨ Key Features
*   **Flexible IP Core Design:** The Custom IP supports two methods for Phase-to-Amplitude conversion:
    *   **LUT (Look-Up Table):** Utilizes Block RAM for fast, 1-2 clock cycle latency.
    *   **CORDIC Algorithm:** An 8-stage pipeline architecture that computes trigonometric functions using only adders and shifters, consuming **0 bits of RAM**.
*   **Avalon-MM Interface:** Seamless communication between the Nios II master and the custom DDS IP slave through the Avalon Switch Fabric.
*   **High Performance:** Achieved a maximum operating frequency ($F_{max}$) of **208.68 MHz** (CORDIC) and 195.85 MHz (LUT).
*   **Bare-metal C Software:** The Nios II processor dynamically controls the output frequency (phase increment) and wave type via low-level register manipulation.

## 📂 Repository Structure
<!-- HƯỚNG DẪN: Bạn có thể sửa lại tên các thư mục dưới đây cho khớp với cây thư mục thực tế trên máy bạn -->
```text
├── doc/                 # Presentation slides, block diagrams, and waveform images
├── rtl/                 # Verilog HDL source files and Qsys system design
├── tb/                  # Testbench files for ModelSim verification
├── sw/            # Embedded C code (Eclipse SBT) and BSP settings
└── README.md
