import id_pkg::*;
import alu_pkg::*;
module instruction_decoder#(
    parameter INSTRUCTION_WIDTH = 16,
    parameter ALU_OPCODE_WIDTH = 3,
    parameter RF_ADDR_WIDTH = 3,
    parameter MEMORY_ADDR_WIDTH = 10,
    parameter IMMEDIATE_WIDTH = 8,
    parameter MUX_DEMUX_SELECTOR_WIDTH = 2 
)(
    input logic [INSTRUCTION_WIDTH-1:0] instruction,

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

    // Mux and Demux selectors for LOAD and STORE instructions
    output logic [MUX_DEMUX_SELECTOR_WIDTH-1:0] selector,
    
    // Accumulator control
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
                RF_addr = instruction[15:14];
                RF_we = 1'b1;
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
                    IMM_value = instruction[15:7];
                end: immediate_load
            end
            NOP: begin
                RF_we = 0;
                A_we = 0;
            end
            default: begin
                    ALU_opcode = current_code[2:0];
                    RF_addr = instruction[15:14];
                    A_we = 1'b1;
                end
        endcase
    end

endmodule : instruction_decoder