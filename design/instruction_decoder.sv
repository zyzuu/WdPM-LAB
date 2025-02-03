import id_pkg::*;
import alu_pkg::*;
module instruction_decoder#(
    parameter INSTRUCTION_WIDTH = 16,
    parameter ALU_OPCODE_WIDTH = 3,
    parameter RF_ADDR_WIDTH = 2,
    parameter MEMORY_ADDR_WIDTH = 10,
    parameter IMMEDIATE_WIDTH = 8,
    parameter MUX_DEMUX_SELECTOR_WIDTH = 2,
    parameter PC_VALUE_WIDTH = 5
)(
    input logic [INSTRUCTION_WIDTH-1:0] instruction,

    // Carry-out from ALU flag
    input logic carry_out,

    // ALU control
    output logic [ALU_OPCODE_WIDTH-1:0] ALU_opcode,

    // Register File control
    output logic [RF_ADDR_WIDTH-1:0] RF_addr,
    output logic RF_we,

    // Memory control
    output logic [MEMORY_ADDR_WIDTH-1:0] MEM_addr,
    output logic MEM_we,

    // Immediate value
    output logic [IMMEDIATE_WIDTH-1:0] IMM_value,

    // Mux and Demux selectors for LOAD instruction
    output logic [MUX_DEMUX_SELECTOR_WIDTH-1:0] selector,

    // Accumulator control
    output logic A_we,

    // Program counter control, simple jump
    output logic PC_jump_enable,
    output logic [PC_VALUE_WIDTH-1:0] PC_jump_value

);
    cpu_instructions current_code;
    always_comb begin
        A_we = 1'b0;
        MEM_we = 1'b0;
        RF_we = 1'b0;
        RF_addr = 2'b0;
        MEM_addr = 10'b0;
        IMM_value = 8'b0;
        selector = 2'b0;
        ALU_opcode = 3'b111;
        PC_jump_enable = 1'b0;
        PC_jump_value = 5'b0;

        current_code = cpu_instructions'(instruction[3:0]);
        case(current_code)
            STOREMEM: begin
                A_we = 1'b0;
                MEM_we = 1'b1;
                MEM_addr = instruction[13:4];
            end
            STORERF: begin
                A_we = 1'b0;
                RF_we = 1'b1;
                RF_addr = instruction[5:4];
            end
            LOAD: begin
                A_we = 1'b1;
                RF_we = 1'b0;
                ALU_opcode = 3'b111;
                selector = instruction[5:4];

                if (instruction[5:4] == 2'b00) begin: register_load
                    RF_addr = instruction[7:6];
                end: register_load

                else if(instruction[5:4] == 2'b01) begin: memory_load
                    MEM_addr = instruction[15:6];
                end: memory_load

                else if(instruction[5:4] == 2'b10) begin: immediate_load
                    IMM_value = instruction[15:8];
                end: immediate_load

                else begin: default_register_load
                    RF_addr = instruction[7:6];
                end
            end
            NOP: begin
                RF_we = 1'b0;
                MEM_we = 1'b0;
                A_we = 1'b0;
            end
            JUMP: begin
                PC_jump_enable = 1'b1;
                PC_jump_value = instruction[8:4];
            end
            default: begin
                    ALU_opcode = current_code[2:0];
                    selector = instruction[5:4];
                    if (instruction[5:4] == 2'b00) begin: use_value_from_register
                        RF_addr = instruction[7:6];
                    end: use_value_from_register

                    else if(instruction[5:4] == 2'b01) begin: use_value_from_memory
                        MEM_addr = instruction[15:6];
                    end: use_value_from_memory

                    else if(instruction[5:4] == 2'b10) begin: use_immediate_value
                        IMM_value = instruction[15:7];
                    end: use_immediate_value

                    else begin: default_operation_register_load
                        RF_addr = instruction[7:6];
                    end: default_operation_register_load

                    A_we = 1'b1;
                end
        endcase
    end

endmodule : instruction_decoder