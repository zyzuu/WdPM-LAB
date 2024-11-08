module program_counter(
    input clk,
    output logic [4:0] instruction_address
);
logic [4:0] byte_ctr;
always_ff @(posedge clk) begin 
    byte_ctr <= byte_ctr + 1;
    instruction_address <= byte_ctr;
end
endmodule : program_counter