import alu_pkg::*;
module alu(
    input [7:0] i_1,
    input  [7:0] i_2,
    input logic [2:0] op_code,
    
    output logic [7:0] o_main,
    
    input carry_ce,
    output logic [1:0] carry_out
);
   
	
	instruction_code current_code;

	always_comb begin //always_comb nie dziala w iverilogu 10.3
	 current_code = instruction_code'(op_code);
	 case (op_code)
        ADD: o_main = i_1 + i_2;
        SUBTRACT: o_main = i_1 - i_2;
        AND_OP: o_main = i_1 & i_2;
        OR_OP: o_main = i_1 | i_2;
        XOR_OP: o_main = i_1 ^ i_2;
        NOT_OP: o_main = ~i_1;
        REG: o_main = i_2;
        default: o_main = 8'd1; 
    endcase
	end

endmodule : alu