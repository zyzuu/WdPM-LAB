module dff(
    input clk,
    input rst,
    input data_in,
    input we,
    output logic data_out
);

always_ff @(posedge clk) begin
    if(!rst) begin
        if(we) begin
            data_out <= data_in;
        end
    end
    else begin
        data_out <= 0;
    end
end

endmodule: dff
