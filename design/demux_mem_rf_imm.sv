module demux_mem_rf_imm#(parameter DATA_WIDTH = 8, parameter DEMUX_SELECT_BITS = 2)(
    input [DEMUX_SELECT_BITS-1:0] select,
    input [DATA_WIDTH-1:0] data_input_to_demux,
    output [DATA_WIDTH-1:0] data_input_rf,
    output [DATA_WIDTH-1:0] data_input_imm,
    output [DATA_WIDTH-1:0] data_input_mem
);
always_comb begin
    case(select)
        2'b00: begin
            data_input_rf <= data_input_to_demux;
        end
        2'b01: begin
            data_input_mem <= data_input_to_demux;
        end
        2'b10: begin
            data_input_imm <= data_input_to_demux;
        end
        default: begin
            data_input_rf <= data_input_to_demux;
        end
    endcase
end
endmodule: demux_mem_rf_imm