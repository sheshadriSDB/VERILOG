`timescale 1ns/1ps

module up_down_counter (
    input clk,
    output reg [3:0] count
);

    reg dir;   // 1 = UP, 0 = DOWN

    always @(posedge clk) begin
        if (dir) begin
            if (count == 4'd15)
                begin dir <= 0; count <= count - 1; end
            else
                count <= count + 1;
        end
        else begin
            if (count == 4'd0)
                begin dir <= 1; count <= count + 1; end
            else
                count <= count - 1;
        end
    end

endmodule


module tb;
    reg clk = 0;
    wire [3:0] count;

    up_down_counter dut(clk, count);

    always #5 clk = ~clk;

    initial begin
        dut.count = 0;   // simulation only
        dut.dir   = 1;   // start UP
        #300 $finish;
    end

    initial $monitor("%0t  %d", $time, count);
endmodule
