module program_memory(
    input logic [4:0] instruction_address,
    output logic [5:0] instruction
);
logic [5:0]/*word size*/ instruction_set [31:0]/*number of elements in array*/;

initial begin
    $readmemb("/home/student/MG/WdPM/design/memory.mem", instruction_set);
end

assign instruction = instruction_set[instruction_address];

endmodule : program_memory