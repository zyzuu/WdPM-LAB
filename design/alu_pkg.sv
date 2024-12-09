package alu_pkg;
 typedef enum logic [2:0] {
    ADD = 3'b000,
    SUBTRACT = 3'b001,
    AND_OP = 3'b010,
    OR_OP = 3'b011,
    XOR_OP = 3'b100,
    NOT_OP = 3'b101
} instruction_code;

`define ADD 4'b0000;
`define SUBTRACT 4'b0001;
`define AND_OP 4'b0010;
`define OR_OP 4'b0011;
`define XOR_OP 4'b0100;
`define NOT_OP 4'b0101;
`define LOAD 4'b0110;

endpackage : alu_pkg
    