module simple_top(
    input logic clk,
    input logic rst,
    output logic [15:0] instruction_wire,
    output logic RF_we,
    output logic A_we,
    output logic [2:0] ALU_opcode_wire,
    output logic [1:0] RF_addr
);
    localparam DATA_WIDTH = 8;
    localparam MEMORY_ADDR_WIDTH = 10;
    localparam MUX_DEMUX_SELECTOR_WIDTH = 2;
    localparam PC_VALUE_WIDTH = 5;
    logic [4:0] instruction_address_wire;

    logic [1:0] register_address_wire;

    logic carry_in_wire, carry_out_wire;
    logic [DATA_WIDTH-1:0] accumulator_input_wire;
    logic [DATA_WIDTH-1:0] accumulator_output_wire;
    logic [DATA_WIDTH-1:0] register_file_output_wire;
    logic [DATA_WIDTH-1:0] memory_output_wire;
    logic [DATA_WIDTH-1:0] immediate_value_output_wire;
    logic [DATA_WIDTH-1:0] mux_output_wire;
    logic [MEMORY_ADDR_WIDTH-1:0] memory_addr_wire;
    logic [MUX_DEMUX_SELECTOR_WIDTH-1:0] mux_selector_wire;
    logic MEM_we;

    logic [PC_VALUE_WIDTH-1:0] id_pc_jump_value_wire;
    logic id_pc_jump_enable_wire;

    program_counter pc(
        .clk(clk),
        .rst(rst),
        .jump_enable(id_pc_jump_enable_wire),
        .jump_value(id_pc_jump_value_wire),
        .instruction_address(instruction_address_wire)
        );

    program_memory pm(
        .instruction_address(instruction_address_wire),
        .instruction(instruction_wire)
        );

    instruction_decoder id(
        .instruction(instruction_wire),
        .carry_out(carry_out_wire),
        .ALU_opcode(ALU_opcode_wire),
        .RF_addr(RF_addr),
        .RF_we(RF_we),
        .MEM_addr(memory_addr_wire),
        .MEM_we(MEM_we),
        .IMM_value(immediate_value_output_wire),
        .selector(mux_selector_wire),
        .A_we(A_we),
        .PC_jump_enable(id_pc_jump_enable_wire),
        .PC_jump_value(id_pc_jump_value_wire)
        );

    memory mem(
        .clk(clk),
        .rst(rst),
        .addr(memory_addr_wire),
        .we(MEM_we),
        .data_input(mux_output_wire),
        .data_output(memory_output_wire)
        );

    mux_mem_rf_imm mux(
        .data_input_rf(register_file_output_wire),
        .data_input_mem(memory_output_wire),
        .data_input_imm(immediate_value_output_wire),
        .select(mux_selector_wire),
        .data_output_from_mux(mux_output_wire)
        );


    alu alu(
        .i_1(accumulator_output_wire),
        .i_2(mux_output_wire),
        .op_code(ALU_opcode_wire),
        .o_main(accumulator_input_wire),
        .carry_in(carry_in_wire),
        .carry_out(carry_out_wire)
        );

    dff dff(
        .clk(clk),
        .rst(rst),
        .we(A_we),
        .data_in(carry_out_wire),
        .data_out(carry_in_wire)
    );

    accumulator acu(
        .clk(clk),
        .rst(rst),
        .we(A_we),
        .input_from_alu(accumulator_input_wire),
        .output_main(accumulator_output_wire)
        );

    register_file rf(
        .clk(clk),
        .register_address(RF_addr),
        .we(RF_we),
        .accumulator_input(accumulator_output_wire),
        .register_value(register_file_output_wire)
        );

endmodule : simple_top