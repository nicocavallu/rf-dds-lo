/* truncate.v
* this module implements the truncation of the
* 32 bit phase accumulator as it enters the 10 bit LUT
* in order to reduce noise this input is dithered with a
* rng before truncating
*/

module truncate(
    input [31:0] phase_out,
    input [11:0] q,
    output [9:0] phase_truncated);

    wire [31:0] dithered_phase = phase_out + {q, 10'b0};

    assign phase_truncated = dithered_phase[31:22];
endmodule
