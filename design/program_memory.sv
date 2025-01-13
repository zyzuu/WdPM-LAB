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
logic [INSTRUCTION_WIDTH-1:0]/*word size*/ instruction_set [NUMBER_OF_INSTRUCTIONS-1:0]/*number of elements in array*/;

initial begin
    //$readmemb("/home/student/MG/WdPM/design/memory.mem", instruction_set);
    instruction_set[0] = {2'b00, 10'd0, `NOP};
    instruction_set[1] = {2'b00, 10'd0,`ADD};
    instruction_set[2] = {2'b00, 10'd0,`ADD};
    instruction_set[3] = {2'b00, 10'd0,`ADD};
    instruction_set[4] = {2'b00, 10'd0,`ADD};
    instruction_set[5] = {2'b00, 10'd0,`ADD};
    instruction_set[6] = {2'b00, 10'd0,`ADD};
    instruction_set[7] = {2'b00, 10'd0,`ADD};
    instruction_set[8] = {2'b00, 10'd0,`ADD};
    instruction_set[9] = {2'b00, 10'd0,`ADD};
    instruction_set[10] = {2'b01, 10'd0,`STORE};
    instruction_set[11] = { 8'd0,2'b00,2'b00,`LOAD};
    instruction_set[12] = { 8'd0,2'b01,2'b00,`LOAD};
    //instruction_set[12] = {2'b00, 10'd0,`LOAD};
    instruction_set[13] = {2'b00, 10'd0,`ADD};
    instruction_set[14] = {2'b00, 10'd0,`LOAD};
    instruction_set[15] = {2'b00, 10'd0,`ADD};
    instruction_set[16] = {2'b00, 10'd0,`LOAD};
    instruction_set[17] = {2'b01, 10'd0,`STORE};
    instruction_set[18] = {2'b01, 10'd0,`ADD};
    instruction_set[19] = {2'b01, 10'd0,`LOAD};
    instruction_set[20] = {2'b10, 10'd0,`STORE};
end

assign instruction = instruction_set[instruction_address];

endmodule : program_memory