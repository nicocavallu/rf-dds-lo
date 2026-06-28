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

    wire [12:0] noise;

    assign noise = {1'b0,phase_out[21:10]} + {1'b0,q};
    assign phase_truncated = phase_out[31:22] + noise[12];
endmodule
