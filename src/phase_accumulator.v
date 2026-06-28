/* phase_accumulator.v
32 bit phase accumulator that adds the dynamic frequency controlword of the dds-lo to the prevouis phase output every clock cycle.
*/

module phase_accumulator(
    input clk,
    arst_n, // active low asynchronous reset
    input [31:0] fcw_in,
    output reg [31:0] phase_out);

    always @(posedge clk or negedge arst_n) begin
        if (!arst_n) begin
            phase_out <= 32'd0;
        end else begin
            phase_out <= phase_out + fcw_in;
        end
    end

endmodule
