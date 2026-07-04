/* dds_top.v
* This is the top module for the dds local oscillator
* the top module calls instances of every submodule to recreate the
* submodule found in the README.md
*/

module dds_top(
    input clk, arst_n, enable,
    output [35:0] signal_out);

    wire [31:0] fcw_out;
    wire [31:0] phase_out;
    wire [11:0] q;
    wire [9:0] phase_truncated;
    wire [9:0] phase_truncated_cos = phase_truncated + 10'd256;

    fcw_accumulator fcw_acc (.clk(clk), .arst_n(arst_n), .fcw_out(fcw_out));
    phase_accumulator phase_acc (.clk(clk), .arst_n(arst_n), .fcw_in(fcw_out),
        .phase_out(phase_out));
    lfsr_rng lfsr (.clk(clk), .arst_n(arst_n), .q(q));
    truncate trunc (.phase_out(phase_out), .q(q), .phase_truncated(phase_truncated));
    sine_lut lut (.clk(clk), .enable(enable),
        .phase_truncated_sin(phase_truncated),.phase_truncated_cos(phase_truncated_cos),
        .sine_out(signal_out[17:0]), .cosine_out(signal_out[35:18]));

endmodule


