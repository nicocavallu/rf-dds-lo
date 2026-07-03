/* fcw_accumulator.v
* This module it to adapt the basic FCW of a DDS LO to the LoRa css
* Normally the FCW is a specific constant for a specific phase
* However, since the LoRa spectrum changes the FCW need to change to match
* Since the ULX3S clock is only 25MHz the nyquist limit is 12.5MHz
*/

module fcw_accumulator(
    input clk, arst_n,
    output [31:0] fcw_out);

    localparam bit RESET = 1'b0;
    localparam bit COUNT = 1'b1;

    reg state, next_state, ms;
    reg [14:0] counter = 15'b0;
    reg [31:0] fcw_count;
    wire [9:0] inc = 859;
    wire [31:0] fcw_freq = 32'd1717986918;
    wire [31:0] fcw_b = 32'd21474836;

    always_comb begin
        case (state)
            RESET: next_state = COUNT;
            COUNT: next_state = (ms) ? RESET : COUNT;
            default: next_state = state;
        endcase
    end

    always @(posedge clk or negedge arst_n) begin
        if (~arst_n) begin
            state <= RESET;
            fcw_count <= fcw_freq + fcw_b/2;
        end else begin
            state <= next_state;

            if (next_state == RESET) begin
                fcw_count <= fcw_freq + fcw_b/2;
            end else begin
                fcw_count <= fcw_count - inc;
            end
        end
    end

    always @(posedge clk) begin
        if (counter == 15'd24999) begin
            counter <= 15'b0;
            ms <=1'b1;
        end else begin
            counter <= counter + 1'b1;
            ms <= 1'b0;
        end
    end

    assign fcw_out = fcw_count;

    endmodule
