`timescale 1ns/1ps

module down_counter_4bit(input clk, output reg [3:0] count);
    always @(posedge clk) count <= count - 1;
endmodule

module tb;
    reg clk = 0;
    wire [3:0] count;

    down_counter_4bit dut(clk, count);

    always #5 clk = ~clk;

    initial begin
        dut.count = 4'hF;   // simulation-only initialization
        #100 $finish;
    end

    initial $monitor("%0t  %b (%0d)", $time, count, count);
endmodule
