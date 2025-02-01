//`define ADD 4'b0000;
//`define SUBTRACT 4'b0001;
//`define AND_OP 4'b0010;
//`define OR_OP 4'b0011;
//`define XOR_OP 4'b0100;
//`define NOT_OP 4'b0101;
import alu_pkg::*;
module alu#(parameter DATA_WIDTH = 8, parameter OPCODE_WIDTH = 3)(
    input [DATA_WIDTH-1:0] i_1,
    input [DATA_WIDTH-1:0] i_2,
    input logic [OPCODE_WIDTH-1:0] op_code,

    output logic [DATA_WIDTH-1:0] o_main,

    input carry_in,
    output logic carry_out
);
    //instruction_code current_code;

    always_comb begin //always_comb nie dziala w iverilogu 10.3
        carry_out = 0;
        //current_code = instruction_code'(op_code);
        case (op_code)
            ADD: begin
                {carry_out, o_main} = i_1 + i_2 + carry_in;
                end
            SUBTRACT: begin
                o_main = i_1 - i_2 + carry_in;
            end
            AND_OP: o_main = i_1 & i_2;
            OR_OP: o_main = i_1 | i_2;
            XOR_OP: o_main = i_1 ^ i_2;
            NOT_OP: o_main = ~i_1;
            default: begin
                carry_out = carry_in;
                o_main = i_2; //LOAD AS A DEFAULT ACTION
            end
            endcase
    end

endmodule : alu