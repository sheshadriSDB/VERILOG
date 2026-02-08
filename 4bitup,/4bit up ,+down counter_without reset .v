`timescale 1ns/1ps

// =======================================
// DESIGN: 4-bit SYNCHRONOUS COUNTER
// =======================================
module counter_4bit_sync (
    input  wire clk,
    input  wire up_down,     // Used only for UP/DOWN counter
    output reg  [3:0] q
);

    // Initialization (for simulation only)
    initial begin
        q = 4'b0000;
    end

    always @(posedge clk) begin

        // ----------- OPTION 1: UP COUNTER -----------
        // Uncomment this block for UP counter
        /*
        q <= q + 1'b1;
        */

        // ----------- OPTION 2: DOWN COUNTER ----------
        // Uncomment this block for DOWN counter
        /*
        q <= q - 1'b1;
        */

        // ----------- OPTION 3: UP/DOWN COUNTER -------
        // Uncomment this block for UP/DOWN counter
        /*
        if (up_down)
            q <= q + 1'b1;
        else
            q <= q - 1'b1;
        */

    end

endmodule


// =======================================
// TESTBENCH (COMMON FOR ALL)
// =======================================
module tb_counter_4bit_sync;

    reg clk;
    reg up_down; //only use for updown counter //
    wire [3:0] q;

    // DUT
    counter_4bit_sync dut (
        .clk(clk),
        .up_down(up_down), // up_down (up_down) to up_down(1'b1) for up counter , 1'b0 for down counter//
        .q(q)
    );

    // Clock generation (10 ns)
    always #5 clk = ~clk;

    initial begin
        clk = 0;
        up_down = 1; //only use up down counter // 

        // Run for some cycles
        repeat (10) @(posedge clk);

        // Change direction (used only for UP/DOWN counter)
        up_down = 0;
        repeat (10) @(posedge clk);

        #20;
        $finish;
    end

    initial begin
        $monitor("Time=%0t | up_down=%b | q=%b",
                  $time, up_down, q);
    end

endmodule
