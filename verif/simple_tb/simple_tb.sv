`timescale 1ns/1ns
module top();
    reg clk;
    wire [15:0] instruction_wire;
    reg rst;
    reg ALU_ce;
    reg A_re;
    reg [2:0] ALU_opcode_wire;
    reg [1:0] RF_addr;
    logic RF_we;

    simple_top dut(.clk(clk), .rst(rst), .instruction_wire(instruction_wire),
    //.ce_0_wire(ce_0_wire),
    //.ce_1_wire(ce_1_wire),
    //.ce_2_wire(ce_2_wire),
    //.ce_3_wire(ce_3_wire),
    .RF_we(RF_we),
    .A_we(A_re),
    .ALU_opcode_wire(ALU_opcode_wire),
    .RF_addr(RF_addr));

    initial clk = 0;
    always #100 clk = ~clk;

    initial rst <= 1;

    initial begin
        #100 rst <= 0;
    //repeat(32) begin
    //    @(posedge clk);
    //    $display("instruction: %b", instruction);
    //end
        #16000 $finish;
    end
    initial begin
    $dumpfile ("dump.vcd");
    $dumpvars;
    end

endmodule : top