module simple_top(
    input logic clk,
    input logic rst,
    output logic [15:0] instruction_wire,
    //output logic ce_0_wire,
    //output logic ce_1_wire,
    //output logic ce_2_wire,
    //output logic ce_3_wire,
    output logic RF_we,
    output logic ALU_ce,
    output logic A_ce,
    output logic [2:0] ALU_opcode_wire,
    output logic [1:0] RF_addr
);
    logic [4:0] instruction_address_wire;
    //logic [5:0] instruction_wire;
    logic [2:0] register_address_wire;
    //logic [1:0] RF_addr;
    //logic ce_0_wire, ce_1_wire, ce_2_wire, ce_3_wire, ALU_ce, A_ce;
    //logic [2:0] ALU_opcode_wire;
    logic carry_we_wire, carry_out_wire; 
    logic [7:0] accumulator_input_wire;
    logic [7:0] accumulator_output_wire;
    logic [7:0] register_file_output_wire;

    program_counter pc(.clk(clk), .rst(rst), .instruction_address(instruction_address_wire));
    program_memory pm(.instruction_address(instruction_address_wire), .instruction(instruction_wire));
    instruction_decoder id(.instruction(instruction_wire), .ALU_opcode(ALU_opcode_wire), .ALU_ce(ALU_ce), .RF_addr(RF_addr), /*.RF_ce_0(ce_0_wire),
    .RF_ce_1(ce_1_wire), .RF_ce_2(ce_2_wire), .RF_ce_3(ce_3_wire), */.RF_we(RF_we), .A_ce(A_ce));
    alu alu(.i_1(accumulator_output_wire), .i_2(register_file_output_wire), .op_code(ALU_opcode_wire), .ALU_ce(ALU_ce), .o_main(accumulator_input_wire), .carry_we(carry_we_wire), .carry_out(carry_out_wire));
    accumulator acu(.clk(clk), .rst(rst), .ce(A_ce), .input_from_alu(accumulator_input_wire), .output_main(accumulator_output_wire));
    register_file rf(.clk(clk), .register_address(RF_addr), .we(RF_we), .accumulator_input(accumulator_output_wire), .register_value(register_file_output_wire));
endmodule : simple_top