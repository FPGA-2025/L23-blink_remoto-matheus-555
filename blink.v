module Blink #(
    parameter CLK_FREQ = 25_000_000 
) (
    input wire clk,
    input wire rst_n,
    output reg [7:0] leds
);
    localparam ONE_SECOND  = CLK_FREQ;
    localparam HALF_SECOND = CLK_FREQ / 5;

    reg [31:0] counter;

    always @(posedge clk ) begin
        if (!rst_n) begin
            counter <= 32'h0;
            leds     <= 8'b0;
        end else begin
            if (counter >= HALF_SECOND - 1) begin
                counter <= 32'h0;
                leds[0]     <= 1'b0;
                leds[7]     <= 1'b0;
            end else begin
                counter <= counter + 1;
                leds[0]     <= 1'b1;
                leds[7]     <= 1'b1;
            end
        end
    end
    
endmodule
