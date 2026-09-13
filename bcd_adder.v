module bcd_adder (
    input  [3:0] a, b,
    input        carry_in,
    output [3:0] sum,
    output       carry
);

reg [4:0] sum_temp;
reg [3:0] sum;
reg       carry;

always @(*)
begin
    sum_temp = a + b + carry_in;
    if (sum_temp > 9)
    begin
        sum_temp = sum_temp + 6;
        carry = 1;
        sum = sum_temp[3:0];
    end
    else
    begin
        carry = 0;
        sum = sum_temp[3:0];
    end
end

endmodule


module bcd_seg (
    input  wire        clk,
    input  wire [3:0] sum,
    input  wire        carry,
    output reg  [1:0] digit,          // 2 digit enables
    output reg  [7:0] Seven_Segment   // {A,B,C,D,E,F,G,DP}, active LOW
);

    reg [16:0] div = 0;
    reg scan = 0;
    reg [3:0] BCDin;

    // --------------------------------------------------
    // Clock divider
    // Assuming 100 MHz clock
    // --------------------------------------------------
    always @(posedge clk)
    begin
        if (div == 17'd99999)
        begin
            div <= 0;
            scan <= ~scan;
        end
        else
            div <= div + 1;
    end

    // --------------------------------------------------
    // Select digit
    // --------------------------------------------------
    always @(*)
    begin
        case (scan)
            1'b0:
            begin
                digit = 2'b01;
                BCDin = sum;          // Ones digit
            end
            1'b1:
            begin
                digit = 2'b10;
                BCDin = {3'b000, carry}; // Tens digit
            end
        endcase
    end

    // --------------------------------------------------
    // BCD to 7-segment decoder
    // --------------------------------------------------
    always @(*)
    begin
        case (BCDin)
            4'd0: Seven_Segment = 8'b00000011;
            4'd1: Seven_Segment = 8'b10011111;
            4'd2: Seven_Segment = 8'b00100101;
            4'd3: Seven_Segment = 8'b00001101;
            4'd4: Seven_Segment = 8'b10011001;
            4'd5: Seven_Segment = 8'b01001001;
            4'd6: Seven_Segment = 8'b01000001;
            4'd7: Seven_Segment = 8'b00011111;
            4'd8: Seven_Segment = 8'b00000001;
            4'd9: Seven_Segment = 8'b00001001;
            default:
                Seven_Segment = 8'b11111111;
        endcase
    end

endmodule
