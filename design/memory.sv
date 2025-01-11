module memory#(parameter DATA_WIDTH = 8, parameter NUMBER_OF_ELEMETS = 1024)(
    input clk,
    input rst,
    input [NUMBER_OF_ELEMETS-1:0] addr,
    input we, // 1 for write; 0 for read
    input [DATA_WIDTH-1:0] data_input,
    output logic [DATA_WIDTH-1:0] data_output
);
logic [DATA_WIDTH-1:0] mem [NUMBER_OF_ELEMETS-1:0];

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