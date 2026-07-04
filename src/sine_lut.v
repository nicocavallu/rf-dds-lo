/* sine_lut.v
* This module is a 10-input LUT that outputs a sine wave and cosine wave
* the input is based on the truncated output of the phase accumulator
* */

module sine_lut(
    input clk, enable,
    input [9:0] phase_truncated_sin, phase_truncated_cos,
    output reg signed [17:0] sine_out, cosine_out);

    reg signed [17:0] rom [1024];

    initial begin
        $readmemh("../scripts/sine_table.mem", rom);
    end

    always @(posedge clk) begin
        if (enable) begin
            sine_out <= rom[phase_truncated_sin];
            cosine_out <= rom[phase_truncated_cos];
        end
    end
endmodule
