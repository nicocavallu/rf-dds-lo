# RF-DDS-LO

## Overview
The goal of this project is to create a Direct Digital Synthesizer (DDS) that functions as a Local Oscillator (LO) for RF and DSP applications. The DDS-LO is a the first part of my overarching project involving the Radiona ULX3S FPGA and the HackRF Pro SDR to explore and learn about wireless communication and HDL. 

## Hardware Requirements 

### FPGA Platform:  
[Radiona ULX3S](https://radiona.org/ulx3s/) (Lattice ECP5 LFE5U-85F)

### SDR Platform:
[HackRF Pro](https://greatscottgadgets.com/hackrf/pro/)

### Master System Clock:  
25MHz (Onboard crystal oscillator)

### Phase Accumulator Resolution:  
32-bit parameterized phase-word depth

### Target Output Signal:  
1 MHz baseline test-carrier

## Software Environment and Requirements

### Operating System:   
This project was developed in an Arch Linux environment using open-source hardware toolchain dependencies. 

### Dependencies:  
* iverilog  
* gtkwave  
* yosys 
* nextpnr-ecp5  
* fujprog

## Quick Start: 
