module program_counter#(parameter BITS_FOR_INSTRUCTIONS = 5)(
    input logic clk,
    input logic rst,
    // Controlled from Instruction Decoder
    input logic jump_enable,
    input logic [BITS_FOR_INSTRUCTIONS-1:0] jump_value,

    output logic [BITS_FOR_INSTRUCTIONS-1:0] instruction_address
);
logic [BITS_FOR_INSTRUCTIONS-1:0] instruction_ctr = 0;

always_ff @(posedge clk) begin
    if (!rst) begin
        if (!jump_enable) begin
            instruction_ctr <= instruction_ctr + 1'b1;
        end
        else begin
            instruction_ctr <= jump_value;
        end
    end
    else begin
        instruction_ctr <= 0;
    end
end

assign instruction_address = instruction_ctr;
endmodule : program_counter