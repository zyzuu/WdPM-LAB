`define ADD 4'b0000
`define SUBTRACT 4'b0001
`define AND_OP 4'b0010
`define OR_OP 4'b0011
`define XOR_OP 4'b0100
`define NOT_OP 4'b0101
`define LOAD 4'b0110
`define STORE 4'b0111
`define NOP 4'b1111
module program_memory#(parameter BITS_FOR_INSTRUCTIONS = 5, parameter INSTRUCTION_WIDTH = 16, parameter NUMBER_OF_INSTRUCTIONS=32)(
    input logic [BITS_FOR_INSTRUCTIONS-1:0] instruction_address,
    output logic [INSTRUCTION_WIDTH-1:0] instruction
);
logic [INSTRUCTION_WIDTH-1:0]/*word size*/ instruction_set [0:NUMBER_OF_INSTRUCTIONS-1]/*number of elements in array*/;

initial begin
    //$readmemb("/home/student/MG/WdPM/design/memory.mem", instruction_set);
    //$display("Instruction_set: %p", instruction_set);
    $display("ADD: %b, LOAD: %b", `ADD, `LOAD);
    instruction_set[0] = {`NOP,2'b00, 10'd0};
    instruction_set[1] = {`ADD,2'b00, 10'd0};
    instruction_set[2] = {`LOAD,2'b00, 10'd0};
    instruction_set[3] = {`ADD,2'b00, 10'd0};
    instruction_set[4] = {`LOAD,2'b00, 10'd0};
    instruction_set[5] = {`ADD,2'b00, 10'd0};
    instruction_set[6] = {`LOAD,2'b00, 10'd0};
    instruction_set[7] = {`ADD,2'b00, 10'd0};
    instruction_set[8] = {`LOAD,2'b00, 10'd0};
    instruction_set[9] = {`ADD,2'b00, 10'd0};
    instruction_set[10] = {`LOAD,2'b00, 10'd0};
    instruction_set[11] = {`ADD,2'b00, 10'd0};
    instruction_set[12] = {`LOAD,2'b00, 10'd0};
    instruction_set[13] = {`ADD,2'b00, 10'd0};
    instruction_set[14] = {`LOAD,2'b00, 10'd0};
    instruction_set[15] = {`ADD,2'b00, 10'd0};
    instruction_set[16] = {`LOAD,2'b00, 10'd0};
    instruction_set[17] = {`STORE, 2'b01, 10'd0};
    instruction_set[18] = {`ADD,2'b01, 10'd0};
    instruction_set[19] = {`LOAD,2'b01, 10'd0};
    instruction_set[20] = {`STORE, 2'b10, 10'd0};
end

assign instruction = instruction_set[instruction_address];

endmodule : program_memory