module accumulator(

    input [7:0] input_from_alu,
    output logic [7:0] output_main,

    input clk,
    input ce
);

always_ff @(posedge clk) begin
    if(ce)
        output_main <= input_from_alu;
end

endmodule : accumulator