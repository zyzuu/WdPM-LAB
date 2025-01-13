module mux_mem_rf_imm#(parameter DATA_WIDTH = 8, parameter MUX_SELECT_BITS = 2)(
    input [DATA_WIDTH-1:0] data_input_rf,
    input [DATA_WIDTH-1:0] data_input_mem,
    input [DATA_WIDTH-1:0] data_input_imm,
    input [MUX_SELECT_BITS-1:0] select,
    output [DATA_WIDTH-1:0] data_output_from_mux,
);
always_comb begin
    case(select)
        2'b00: begin
            data_output_from_mux <= data_input_rf;
        end
        2'b01: begin
            data_output_from_mux <= data_input_mem;
        end
        2'b10: begin
            data_output_from_mux <= data_input_imm;
        end
        default: begin
            data_output_from_mux <= data_input_rf;
        end
    endcase
end
endmodule: mux_mem_rf_imm