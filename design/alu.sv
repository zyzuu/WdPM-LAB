module alu(
    input [7:0] i_1,
    input  [7:0] i_2,
    
    output logic [7:0] o_main,
    
    input carry_ce,
    output logic carry_out
);
    enum logic [2:0] {
        ADD = 3'b000,
        SUBTRACT = 3'b001,
        AND_OP = 3'b010,
        OR_OP = 3'b011,
        XOR_OP = 3'b100,
        NOT_OP = 3'b101,
        REG = 3'b110
    } instruction_code;
	 
	always @(instruction_code) begin //always_comb nie dziala w systemverilogu
    case (instruction_code)
        ADD: o_main = i_1 + i_2;
        SUBTRACT: o_main = i_1 - i_2;
        AND_OP: o_main = i_1 & i_2;
        OR_OP: o_main = i_1 | i_2;
        XOR_OP: o_main = i_1 ^ i_2;
        NOT_OP: o_main = ~i_1+1;
        REG: o_main = i_2;
        default: o_main = 8'd0; 
    endcase
	end

endmodule : alu