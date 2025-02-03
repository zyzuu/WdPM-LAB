package share_pkg;
    typedef enum logic[3:0] {
        LOAD = 4'b0111,
        STOREMEM = 4'b1000,
        STORERF = 4'b1001,
        JUMP = 4'b1010,
        NOP = 4'b1111
    } cpu_instructions;

    typedef enum logic [2:0] {
        ADD = 3'b000,
        SUBTRACT = 3'b001,
        AND_OP = 3'b010,
        OR_OP = 3'b011,
        XOR_OP = 3'b100,
        NOT_OP = 3'b101,
        LOAD_OP = 3'b111
    } alu_instructions;

    typedef enum logic [1:0] {
        RF_load = 2'b00,
        MEM_load = 2'b01,
        IMM_load = 2'b10,
        DEFAULT_load = 2'b11 //RF_load
    } load_type;

endpackage: share_pkg