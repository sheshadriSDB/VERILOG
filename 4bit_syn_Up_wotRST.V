`timescale 1ns/1ps

// --------------------
// 4-bit Up Counter
// --------------------
module up_counter_4bit (
    input  wire clk,
    output reg  [3:0] count
);

always @(posedge clk) begin
    count <= count + 1;
end

endmodule


// --------------------
// Testbench
// --------------------
module tb_up_counter_4bit;

    reg clk;
    wire [3:0] count;

    // Instantiate DUT (Device Under Test)
    up_counter_4bit dut (
        .clk(clk),
        .count(count)
    );

    // Clock generation: 10 ns period
    initial begin
        clk = 0;
        forever #5 clk = ~clk;
    end

    // Simulation control
    initial begin
        // Optional initialization (for clean simulation)
        dut.count = 4'b0000;

        #100;          // run for 100 ns
        $finish;
    end

    // Monitor output
    initial begin
        $monitor("Time=%0t | Count=%b (%0d)", $time, count, count);
    end

endmodule


