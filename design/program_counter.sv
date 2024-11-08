module program_counter(
    input logic clk,
    input logic rst,
    output logic [4:0] instruction_address
);
logic [4:0] byte_ctr;

always_ff @(posedge clk) begin 
    if(!rst) begin
        byte_ctr <= byte_ctr + 1'b1;
        instruction_address <= byte_ctr;
    end
    else begin
        byte_ctr <= 0;
    end 
end
endmodule : program_counter