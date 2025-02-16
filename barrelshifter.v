module barrelshifter(input clock, input [1:0] SA, input left, input [3:0] in, output reg [3:0] out=0);

always @(posedge clock) begin
    if (left) begin
        out <= in << SA;
    end
    else begin
        out <= in >> SA;
    end
end

endmodule



module barrelshifter_tb();

reg clock=0;
reg [1:0] SA;
reg left;
reg [3:0] in=4'b1011;
wire [3:0] out;

barrelshifter uut (
    clock, SA, left, in, out
);

always begin
    #5; clock = !clock;
end

initial begin
    SA = 2'b00; left = 0; #10;
    SA = 2'b01; left = 0; #10;
    SA = 2'b10; left = 0; #10;
    SA = 2'b11; left = 0; #10;
    SA = 2'b00; left = 1; #10;
    SA = 2'b01; left = 1; #10;
    SA = 2'b10; left = 1; #10;
    SA = 2'b11; left = 1; #10;
end

endmodule