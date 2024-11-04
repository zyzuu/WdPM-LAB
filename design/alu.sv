import alu_pkg::*;
module alu(
    input [7:0] i_1,
    input  [7:0] i_2,
    input logic [2:0] op_code,
    input ALU_ce,
    
    output logic [7:0] o_main,
    
    input carry_ce,
    output logic carry_out
);
   
	
	instruction_code current_code;

	always_comb begin //always_comb nie dziala w iverilogu 10.3
        if(ALU_ce) begin
	     current_code = instruction_code'(op_code);
	     case (op_code)
            ADD: begin 
                //o_main = i_1 + i_2;
                {carry_out, o_main} = i_1 + i_2 + carry_ce;
                end
            SUBTRACT: begin
                o_main = i_1 - i_2;
                //TODO: ADD BORROW FLAG
            end
            AND_OP: o_main = i_1 & i_2;
            OR_OP: o_main = i_1 | i_2;
            XOR_OP: o_main = i_1 ^ i_2;
            NOT_OP: o_main = ~i_1;
            LOAD: o_main = i_2;
            default: o_main = i_2; //LOAD AS A DEFAULT ACTION
        endcase
        end
	end

endmodule : alu