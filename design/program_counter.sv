module program_counter#(parameter BITS_FOR_INSTRUCTIONS = 5)(
    input logic clk,
    input logic rst,
    output logic [BITS_FOR_INSTRUCTIONS-1:0] instruction_address
);
logic [BITS_FOR_INSTRUCTIONS-1:0] instruction_ctr = 0;

always_ff @(posedge clk) begin
    if(!rst) begin
        instruction_ctr <= instruction_ctr + 1'b1;
        //instruction_address <= instruction_ctr;
    end
    else begin
        instruction_ctr <= 0;
    end
end

assign instruction_address = instruction_ctr; 
endmodule : program_counter