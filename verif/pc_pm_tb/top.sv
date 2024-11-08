`timescale 1ns/1ns
module top();
    reg clk;
    wire [5:0] instruction;
    reg rst;
    
    simple_top dut(.clk(clk), .rst(rst), .instruction(instruction));
    initial clk = 0;
    always #5 clk = ~clk; 
    
    initial rst <= 1;

    initial begin
        #5 rst <= 0;
    repeat(32) begin
        @(posedge clk);
        $display("instruction: %b", instruction);
    end
        #50 $finish;
    end

endmodule : top