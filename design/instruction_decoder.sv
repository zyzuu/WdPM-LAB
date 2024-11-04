import id_pkg::*;
module instruction_decoder(
    input logic [5:0] instruction,

    output logic ce_reg_1,
    output logic ce_reg_2,
    output logic ce_reg_3,
    output logic ce_reg_4,
    
    output logic [2:0] ALU_opcode,
    output logic ALU_ce

);
cpu_instructions current_code;
always_comb begin
    current_code = cpu_instructions'(instruction[5:1])
    case(current_code) inside
        STORE: begin
            ALU_ce = 0;
        end;
        NOP: begin
            ALU_ce = 0;
            ce_reg_1 = 0;
            ce_reg_2 = 0;
            ce_reg_3 = 0;
            ce_reg_4 = 0;
        end;
        default: begin
                ALU_ce = 1'b1;
                ALU_opcode = current_code;
            end;
    endcase
end

endmodule : instruction_decoder