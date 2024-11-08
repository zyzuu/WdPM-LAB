module top();
    logic [5:0] instruction;
    instruction_decoder dut(.instruction(instruction));
    initial begin
        instruction = 6'b000000;
        //#2 $display("instruction: %b, ce_reg_1: %b", instruction/*, ce_reg_1*/);
        //#1 instruction = 6'b000001;
        //#2 $display("instruction: %b, ce_reg_1: %b", instruction/*, ce_reg_1*/);
        //#1 instruction = 6'b001000;
        //#2 $display("instruction: %b, ce_reg_1: %b", instruction/*, ce_reg_1*/);
        //#1 instruction = 6'b111100;
        //#2 $display("instruction: %b, ce_reg_1: %b", instruction/*, ce_reg_1*/);

    end

endmodule : top