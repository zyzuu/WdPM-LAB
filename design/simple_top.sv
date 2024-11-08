module simple_top(
    input logic clk,
    input logic rst,
    output logic [5:0] instruction
);
    logic [4:0] instruction_address_wire;

    program_counter pc(.clk(clk), .rst(rst), .instruction_address(instruction_address_wire));
    program_memory pm(.instruction_address(instruction_address_wire), .instruction(instruction));
endmodule : simple_top