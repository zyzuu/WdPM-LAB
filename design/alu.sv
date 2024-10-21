module alu(
    input [7:0] i_1,
    input [7:0] i_2,
    
    output [7:0] o_main,
    
    input carry_ce,
    output carry_out
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
        ADD: o_main = i_1 + i_2;
        SUBTRACT: o_main = i_1 - i_2;
        AND_OP: o_main = i_1 & i_2;
        OR_OP: o_main = i_1 | i_2;
        XOR_OP: o_main = i_1 ^ i_2;
        NOT_OP: o_main = !i_1;
        REG: o_main = i_2;
        default: o_main = 8b'0; 
    endcase

endmodule : alu