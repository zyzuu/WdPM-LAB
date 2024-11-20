import id_pkg::*;
import alu_pkg::*;
module instruction_decoder(
    input logic [5:0] instruction,

    //ALU control
    output logic [2:0] ALU_opcode,
    output logic ALU_ce,

    //Register File control
    output logic [1:0] RF_addr,
    //output logic RF_ce_0,
    //output logic RF_ce_1,
    //output logic RF_ce_2,
    //output logic RF_ce_3,
    output logic RF_ce,

    //Accumulator control
    output logic A_ce

);
    cpu_instructions current_code;
    always_comb begin
        current_code = cpu_instructions'(instruction[5:2]);
        case(current_code)
            STORE: begin
                ALU_ce = 0;
                A_ce = 1'b1;
                RF_addr = instruction[1:0];
                RF_ce = 1'b1;
            end
            NOP: begin
                ALU_ce = 0;
                RF_ce = 0;
                //RF_ce_0 = 0;
                //RF_ce_1 = 0;
                //RF_ce_2 = 0;
                //RF_ce_3 = 0;
            end
            default: begin
                    ALU_ce = 1'b1;
                    ALU_opcode = current_code;
                    //ce_reg_1 = 1'b1;
                    RF_addr = instruction[1:0];
                    RF_ce = 0;
                    //RF_ce_0 = 0;
                    //RF_ce_1 = 0;
                    //RF_ce_2 = 0;
                    //RF_ce_3 = 0;
                end
        endcase
    end

endmodule : instruction_decoder