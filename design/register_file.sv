module register_file(
    input logic clk,
    input logic [1:0] register_address,
    input logic ce,
    input logic [7:0] accumulator_input,

    output logic [7:0] register_value

);

logic [7:0] reg0;
logic [7:0] reg1;
logic [7:0] reg2;
logic [7:0] reg3;


always_ff @(posedge clk) begin
    if(ce) begin
        case(register_address)
            2'b00: begin
                reg0 <= accumulator_input;
            end
            2'b01: begin
                reg2 <= accumulator_input;
            end
            2'b10: begin
                reg2 <= accumulator_input;
            end
            2'b11: begin
                reg3 <= accumulator_input;
            end
        endcase
    end
end

always_comb begin
    case(register_address)
        2'b00: begin
            register_value = reg0;
        end
        2'b01: begin
            register_value = reg1;
        end
        2'b10: begin
            register_value = reg2;
        end
        2'b11: begin
            register_value = reg3;
        end
    endcase
end
endmodule : register_file