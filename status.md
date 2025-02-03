# TODO:
# Design part
1. ALU
    - Addition
    - Subtraction
    - AND Operation
    - OR Operation
    - XOR Operation
    - NOT Operation
2. Accumulator
    - Works as D flip flop
3. Instruction decoder
    - Takes an instruction
    - Parses instruction and does action
        - Store (to memory and register file)
        - Load (from memory, register file and immediate value)
        - NOP (Do nothing)
        - ALU Operations
        - JUMP
4. Program Counter
    - Works as a counter that increments instruction by 1
    - Works with simple jump, takes value and jump enable from instruction decoder
5. Program Memory
    - Takes an instruction address form PC
    - Sends the proper instruction to the output
6. Register file and Memory
    - Selects proper register and writes the accumulator input to it
7. Simple top
