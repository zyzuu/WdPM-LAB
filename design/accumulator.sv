module accumulator(

    input [7:0] input_from_alu,
    output [7:0] output_,

    input clk,
    input ce
);

always_ff @(posedge clk) begin
    if(ce)
        output_ <= input_from_alu;
end

endmodule : accumulator