module program_memory(
    input logic [4:0] pc_input,
    output logic [5:0] instruction
);
logic [5:0] instruction [31:0];
endmodule : program_memory