module register_file(
    input logic clk,
    input logic [1:0] register_address,
    input logic we,
    input logic [7:0] accumulator_input,
    //input logic [7:0] immediate,

    output logic [7:0] register_value

);

logic [7:0] reg0 = 8'd1;
logic [7:0] reg1 = 8'd0;
logic [7:0] reg2 = 8'd0;
logic [7:0] reg3 = 8'd0;


always_ff @(posedge clk) begin
    if(we) begin
        case(register_address)
            2'b00: begin
                reg0 <= accumulator_input;
            end
            2'b01: begin
                reg1 <= accumulator_input;
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