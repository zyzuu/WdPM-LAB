`define ADD 4'b0000
`define SUBTRACT 4'b0001
`define AND_OP 4'b0010
`define OR_OP 4'b0011
`define XOR_OP 4'b0100
`define NOT_OP 4'b0101
`define LOAD 4'b0110
`define STORE 4'b0111
`define TEST 4'b1111
module program_memory(
    input logic [4:0] instruction_address,
    output logic [15:0] instruction
);
logic [15:0]/*word size*/ instruction_set [0:31]/*number of elements in array*/;

initial begin
    //$readmemb("/home/student/MG/WdPM/design/memory.mem", instruction_set);
    //$display("Instruction_set: %p", instruction_set);
    $display("ADD: %b, LOAD: %b", `ADD, `LOAD);
    instruction_set[0] = {`ADD,2'b00,10'd0};
    instruction_set[1] = {`LOAD,2'b01,10'd0};
    instruction_set[3] = {`ADD,2'b01,10'd0};
    instruction_set[4] = {`STORE,2'b01,10'd0};
end

assign instruction = instruction_set[instruction_address];

endmodule : program_memory