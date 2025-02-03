`define ADD 4'b0000
`define SUBTRACT 4'b0001
`define AND_OP 4'b0010
`define OR_OP 4'b0011
`define XOR_OP 4'b0100
`define NOT_OP 4'b0101
`define LOAD 4'b0111
`define STOREMEM 4'b1000
`define STORERF 4'b1001
`define JUMP 4'b1010
`define NOP 4'b1111
module program_memory#(parameter BITS_FOR_INSTRUCTIONS = 5, parameter INSTRUCTION_WIDTH = 16, parameter NUMBER_OF_INSTRUCTIONS=32)(
    input logic [BITS_FOR_INSTRUCTIONS-1:0] instruction_address,
    output logic [INSTRUCTION_WIDTH-1:0] instruction
);
logic [INSTRUCTION_WIDTH-1:0]/*word size*/ instruction_set [NUMBER_OF_INSTRUCTIONS-1:0]/*number of elements in array*/;

initial begin
    for (int i=0; i<NUMBER_OF_INSTRUCTIONS; i++) begin
        instruction_set[i] = {10'd0, 2'b00,  `NOP};
    end
end

initial begin
    //$readmemb("/home/student/MG/WdPM/design/memory.mem", instruction_set);
    instruction_set[0] = {10'd0, 2'b00,  `NOP};
    instruction_set[1] = {10'd0, 2'b00, `ADD};
    instruction_set[2] = {10'd0, 2'b00, `ADD};
    instruction_set[3] = {10'd0, 2'b00, `ADD};
    instruction_set[4] = {10'd0, 2'b00, `ADD};
    instruction_set[5] = {10'd0, 2'b00, `ADD};
    instruction_set[6] = {10'd0, 2'b00, `ADD};
    instruction_set[7] = {10'd0, 2'b00, `ADD};
    instruction_set[8] = {10'd0, 2'b00, `ADD};
    instruction_set[9] = {10'd0, 2'b00, `ADD};
    instruction_set[10] = {2'd0, 10'd0,`STOREMEM};
    instruction_set[11] = {10'd0, 2'b00,  `NOP};
    instruction_set[12] = {10'd0,2'b01,`LOAD};
    instruction_set[13] = {7'd0, 5'b0,  `JUMP};
    instruction_set[14] = {8'd255,2'b00, 2'b10,`LOAD};
    instruction_set[15] = {10'd0, 2'b10, `ADD};
    instruction_set[16] = {10'd0, 2'b00, `ADD};
    instruction_set[17] = {10'd0, 2'b10,`STORERF};
    //instruction_set[16] = {8'd0,2'b10,2'b00,`LOAD};
    //instruction_set[17] = {2'b00, 10'd123,`STOREMEM};
    instruction_set[18] = {10'd123,2'b01,`LOAD};
    //instruction_set[20] = {2'b10, 10'd0,`STORE};
end

assign instruction = instruction_set[instruction_address];

endmodule : program_memory