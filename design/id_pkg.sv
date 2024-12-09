package id_pkg;
    typedef enum logic[3:0] { 
        LOAD = 4'b0110,
        STORE = 4'b0111,
        NOP = 4'b1111
    } cpu_instructions;
`define STORE 4'b0111;
endpackage : id_pkg