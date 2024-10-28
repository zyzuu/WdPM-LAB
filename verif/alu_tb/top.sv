 `timescale 1ns / 1ps 
module top();
    reg [7:0] in_1;
    reg [7:0] in_2;
    reg [2:0] op_code;
    reg [7:0] o_main;
    reg clk;
     wire [1:0] dbg;
    alu dut(.i_1(in_1), .i_2(in_2), .op_code(op_code), .o_main(o_main), .carry_out(dbg));

    initial begin
        in_1 = 0;
        in_2 = 0;
        op_code = 3'b000;
        $display("%d , %d , %d", in_1, in_2, o_main);
        #5 begin : ADD_TEST
            in_1 = 8'd2;
            in_2 = 8'd3;
            op_code = 3'b000;
                
            #2    $display("op_code: %d", op_code);
            #2    $display("%d, %d, %d, %d", in_1, in_2, o_main, dbg);
        end : ADD_TEST
        #5 begin : SUBTRACT_TEST
            in_1 = 8'd3;
            in_2 = 8'd3;
            op_code = 3'b001;
            #2    $display("op_code: %d", op_code);
            #2    $display("%d, %d, %d, %d", in_1, in_2, o_main, dbg);
        end : SUBTRACT_TEST
        #5 begin : AND_OP_TEST
            in_1 = 8'b01001010;
            in_2 = 8'b11110111;
            op_code = 3'b010;
            #2    $display("op_code: %d", op_code);
            #2    $display("%b, %b, %b, %b", in_1, in_2, o_main, dbg);
        end : AND_OP_TEST
        #5 begin : OR_OP_TEST
            in_1 = 8'b01000010;
            in_2 = 8'b00001000;
            op_code = 3'b011;
            #2    $display("op_code: %d", op_code);
            #2    $display("%b, %b, %b, %d", in_1, in_2, o_main, dbg);
        end : OR_OP_TEST
        #5 begin : XOR_OP_TEST
            in_1 = 8'b01000010;
            in_2 = 8'b00001000;
            op_code = 3'b100;
            #2    $display("op_code: %d", op_code);
            #2    $display("%b, %b, %b, %d", in_1, in_2, o_main, dbg);
        end : XOR_OP_TEST
        #5 begin : NOT_OP_TEST
            in_1 = 8'b1111111;
            in_2 = 8'b0000000;
            op_code = 3'b101;
            #2    $display("op_code: %d", op_code);
            #2    $display("%b, %b, %b, %d", in_1, in_2, o_main, dbg);
        end : NOT_OP_TEST
        #5 begin : REG_WRITE_TEST
            in_1 = 8'd3;
            in_2 = 8'd3;
            op_code = 3'b110;
            #2    $display("op_code: %d", op_code);
            #2    $display("%d, %d, %d, %d", in_1, in_2, o_main, dbg);
        end : REG_WRITE_TEST
    end

endmodule : top