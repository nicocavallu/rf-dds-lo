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
    wire [35:0] signal_out;
    wire signed [17:0] sim_sine = signal_out[17:0];
    wire signed [17:0] sim_cosine = signal_out[35:18];

    // UUT
    dds_top uut(.clk(clk), .arst_n(arst_n), .enable(enable), .signal_out(signal_out));

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

        #500000;

        $display("Simulation Complete");
        $finish;
    end
endmodule
