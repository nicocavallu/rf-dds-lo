/* lfsr_rng.v
* the purpose of this module is to act as a RNG
* that can dither the output of the phase accumulator
* to reduce noise from truncating
* This rng is created with a 12 bit Galois lfsr
*/

module lfsr_rng(
    input clk, arst_n,
    output reg [11:0] q);

    wire feedback = q[0];
    wire [11:0] mask = 12'hC08; // bit mask with taps at positions 11, 10, and 4
    always @(posedge clk or negedge arst_n) begin
        if (!arst_n) begin
            q <=12'hACE; // non-zero seed
        end else begin
            q <= (q >> 1) ^ (feedback ? mask : 12'h0);
        end
    end
endmodule
