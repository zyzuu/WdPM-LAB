# ALU + ACCUMULATOR
### Specification
##### INPUTS:
- 8 bit operand A (input_data_0)
- 8 bit operand B (input_data_1)
- 3 bit operation code (alu_opcode)
- 1 bit Carry-in flag (carry_in)
- 1 bit Accumulator CE (accumulator_ce)
- Clock (clk)
- reset (rst)
##### OUTPUTS:
- 8 bit result (output_data)
- 1 bit carry out flag (carry_out)
##### OPCODES
- ADD = 3'b000
- SUBTRACT = 3'b001
- AND_OP = 3'b010
- OR_OP = 3'b011
- XOR_OP = 3'b100
- NOT_OP = 3'b101
- LOAD = the rest of the codes, default action, usually used as 3'b111
### Functional Requirements
##### Reset
- High state synchronous reset
##### Operation
- Data available after positive clock edge appears if accumulator_ce is high
- Carry out flag appears independently of accumulator_ce and appears in the same clock cycle in which inputs to alu were provided, since alu is a combinational logic block.
- If the result of the add operation overflows 8 bits, the state of the carry out flag changes to 1 and the value is added from zero.
- Carry flag is consumed by arithmetic operations and not by logic operations, but logic operations do not preserve carry flag.
- LOAD operation preserves carry flag
- LOAD operation only works with data_input_1
- NOT operation only works with data_input_0