#!/bin/bash

# Exit immediately if any command fails
set -e

echo "=== Step 1: Generating 18-bit Signed Sine Lookup Table ==="
python3 scripts/gen_sin_table.py

echo "=== Step 2: Compiling Design with SystemVerilog Support ==="
iverilog -g2012 -o sim/dds_sim sim/dds_top_tb.v src/*.v

echo "=== Step 3: Running Simulation ==="
cd sim
vvp dds_sim

echo "=== Step 4: Launching GTKWave ==="
gtkwave dds_top.vcd &
echo "=== Setup Pipeline Complete! ==="
