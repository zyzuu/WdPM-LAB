module register_file(
    input logic clk,
    input logic [1:0] register_address,
    input logic ce_0,
    input logic ce_1,
    input logic ce_2,
    input logic ce_3,
    input logic [7:0] accumulator_input,

    output logic [7:0] value
    
);

logic [7:0] reg0;
logic [7:0] reg1;
logic [7:0] reg2;
logic [7:0] reg3;


always_ff @(posedge clk) begin
    case({ce_3,ce_2,ce_1,ce_0})
        0001: begin
            reg0 <= accumulator_input; 
        end
        0010: begin
            reg2 <= accumulator_input; 
        end
        0100: begin
            reg2 <= accumulator_input; 
        end
        1000: begin
            reg3 <= accumulator_input; 
        end    
   endcase
end

always_comb begin
    case(register_address)
        00: begin
            value = reg0;
        end
        01: begin
            value = reg1;
        end
        10: begin
            value = reg2;
        end
        11: begin
            value = reg3;
        end
    endcase
end
endmodule : register_file