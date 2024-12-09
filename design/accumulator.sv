module accumulator(
    input clk,
    input rst,
    input ce,
    input [7:0] input_from_alu,

    output logic [7:0] output_main
);


always_ff @(posedge clk) begin
    if(!rst) begin
        if(ce) begin
            output_main <= input_from_alu;
        end
    end
    else begin
        output_main <= 0;
    end
end

endmodule : accumulator