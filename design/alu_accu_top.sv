module alu_accu_top#(
    parameter DATA_WIDTH = 8,
    parameter OPCODE_WIDTH = 3
)(
    input clk,
    input rst,
    input accumulator_ce,
    input [DATA_WIDTH-1:0] input_data_0,
    input [DATA_WIDTH-1:0] input_data_1,
    input [OPCODE_WIDTH-1:0] alu_opcode,
    input carry_in,

    output carry_out,
    output [DATA_WIDTH-1:0] output_data
);

    logic [DATA_WIDTH-1:0] accumulator_input_wire;

    alu alu(
        .i_1(input_data_0),
        .i_2(input_data_1),
        .op_code(alu_opcode),
        .o_main(accumulator_input_wire),
        .carry_in(carry_in),
        .carry_out(carry_out)
        );

    accumulator acu(
        .clk(clk),
        .rst(rst),
        .we(accumulator_ce),
        .input_from_alu(accumulator_input_wire),
        .output_main(output_data)
        );

    initial begin
        $dumpfile("minidut.vcd");
        $dumpvars(0);
        end

endmodule : alu_accu_top