package id_pkg;
    typedef enum logic[3:0] {
        LOAD = 4'b0111,
        //STORE = 4'b0111,
        STOREMEM = 4'b1000,
        STORERF = 4'b1001,
        JUMP = 4'b1010,
        NOP = 4'b1111
    } cpu_instructions;
//`define STORE 4'b0111;
`define LOAD 4'b0111;
`define STOREMEM = 4'b1000;
`define STORERF = 4'b1001;
`define NOP 4'b1111;
endpackage : id_pkg