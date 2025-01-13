import id_pkg::*;
import alu_pkg::*;
module instruction_decoder(
    input logic [15:0] instruction,

    //ALU control
    output logic [2:0] ALU_opcode,
    output logic ALU_ce,

    //Register File control
    output logic [1:0] RF_addr,
    //output logic RF_we_0,
    //output logic RF_we_1,
    //output logic RF_we_2,
    //output logic RF_we_3,
    output logic RF_we,

    //Accumulator control
    output logic A_we

);
    cpu_instructions current_code;
    always_comb begin
        A_we = 1'b0;
        $display("instruction: %b", instruction);
        $display("instruction[3:0]: %b", instruction[3:0]);
        current_code = cpu_instructions'(instruction[3:0]);
        case(current_code)
            STORE: begin
                A_we = 1'b0;
                RF_addr = instruction[15:13];
                RF_we = 1'b1;
            end
            LOAD: begin
                A_we = 1'b1;
                //if instruction[]
            end
            NOP: begin
                //ALU_ce = 0;
                RF_we = 0;
                A_we = 0;
                //RF_we_0 = 0;
                //RF_we_1 = 0;
                //RF_we_2 = 0;
                //RF_we_3 = 0;
            end
            default: begin
                    ALU_opcode = current_code[2:0];
                    //ce_reg_1 = 1'b1;
                    RF_addr = instruction[15:14];
                    //RF_we = 0;
                    A_we = 1'b1;
                    //RF_we_0 = 0;
                    //RF_we_1 = 0;
                    //RF_we_2 = 0;
                    //RF_we_3 = 0;
                end
        endcase
    end

endmodule : instruction_decoder