module accumulator#(parameter DATA_WIDTH = 8)(
    input clk,
    input rst,
    input re,
    input [DATA_WIDTH-1:0] input_from_alu,

    output logic [DATA_WIDTH-1:0] output_main
);

always_ff @(posedge clk) begin
    if(!rst) begin
        if(re) begin
            output_main <= input_from_alu;
        end
    end
    else begin
        output_main <= 0;
    end
end

endmodule : accumulator