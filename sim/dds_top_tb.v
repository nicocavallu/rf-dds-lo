/* dds_top_tb
* Testbench for dds local oscillator project
*/

`timescale 1ns/1ps

module dds_top_tb;

    // Inputs
    reg clk;
    reg arst_n;
    reg enable;

    // Output
    wire [17:0] sine_out;

    // UUT
    dds_top uut(.clk(clk), .arst_n(arst_n), .enable(enable), .sine_out(sine_out));

    always begin
        #20 clk = ~clk;
    end

    initial begin

        $dumpfile("dds_top.vcd");
        $dumpvars(0, dds_top_tb);

        clk = 0;
        arst_n = 0;
        enable = 1;

        #40;
        arst_n = 1;

        #5000;

        $display("Simulation Complete");
        $finish;
    end
endmodule
