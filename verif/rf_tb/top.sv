module top();

    logic clk;
    logic rst;
    logic [1:0] addr;
    logic we;
    logic [7:0] data_input;
    logic [7:0] data_output;

    memory dut(.clk(clk), .rst(rst), .addr(addr), .we(we), .data_input(data_input), .data_output(data_output));

    initial clk = 0;
    always #100 clk = ~clk;

    initial rst <= 1;

    initial begin
        #100 rst <= 0;
        @(posedge clk) 
            we <= 1;
            addr <= 2'b00;
            data_input <= 8'd10;

        @(posedge clk)
            we <= 1;
            addr <= 2'b01;
            data_input <= 8'd32;

        @(posedge clk)
            we <= 1;
            addr <= 2'b10;
            data_input <= 8'd64;
        @(posedge clk)
            we <= 0;
        @(posedge clk)
            addr <= 2'b00;
        @(posedge clk)
            addr <= 2'b01;
        @(posedge clk)
            addr <= 2'b10;

        #160 $finish;
    end

    initial begin
    $dumpfile ("dump.vcd");
    $dumpvars;
    end

endmodule : top