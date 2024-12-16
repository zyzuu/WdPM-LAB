module memory(
    input clk,
    input rst,
    input [1:0] addr,
    input we,
    input [7:0] data_input,
    output logic [7:0] data_output
);
localparam DATA_WIDTH = 1024;
logic [7:0] mem [DATA_WIDTH-1:0];
logic [7:0] tmp_data;

always @(posedge clk) begin
    if (rst) begin
        for (int i = 0; i < DATA_WIDTH; i++) begin
            mem[i] <= 0;
        end
    end
end

always @(posedge clk) begin
    if(!rst) begin
        if (we) begin
            mem[addr] <= data_input;
        end
        else begin
            data_output <= mem[addr];
        end
    end
end

//assign data_output = !we ? mem[addr] : 'hz;

endmodule : memory