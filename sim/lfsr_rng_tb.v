/* lfsr_rng_tb
* Testbench for the lfsr rng
* using uut instance and gtkwave
*/

`timescale 1ns/1ps

module lfsr_rng_tb;

    // Inputs
    reg clk;
    reg arst_n;

    // Outputs
    wire [11:0] q;

    // UUT
    lfsr_rng uut (.clk(clk),
        .arst_n(arst_n),
        .q(q));

    // 50 Mhz clock period
    always begin
        #10 clk = ~clk;
    end

    initial begin

    $dumpfile("lfsr_sim.vcd");
    $dumpvars(0, lfsr_rng_tb);


        clk = 0;
        arst_n = 0;

        #40;
        arst_n = 1;

        #5000

        $display("Simulation Complete");
        $finish;
    end
endmodule


