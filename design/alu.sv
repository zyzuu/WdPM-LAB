module alu(
    input [7:0] i_accumulator,
    input [7:0] i_reg_file,
    output [7:0] o_accumulator
)
    enum logic[2:0] {
        ADD = 3'b000,
        SUBTRACT = 3'b001,
        AND_OP = 3'b010,
        OR_OP = 3'b011,
        XOR_OP = 3'b100,
        NOT_OP = 3'b101,
        REG = 3'b110
    } instruction_code;

    case (instruction_code)
        ADD: o_accumulator = i_accumulator + i_reg_file;
        SUBTRACT: o_accumulator = i_accumulator - i_reg_file;
        AND_OP: o_accumulator = i_accumulator & i_reg_file;
        OR_OP: o_accumulator = i_accumulator | i_reg_file;
        XOR_OP: o_accumulator = i_accumulator ^ i_reg_file;
        NOT_OP: o_accumulator = !i_accumulator;
        REG: o_accumulator = i_reg_file;
        default: o_accumulator = 8b'0; 
    endcase
    
endmodule : alu