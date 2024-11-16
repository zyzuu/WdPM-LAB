# Design part
## Completed

## Partially completed
1. ALU
    - Addition
    - Subtraction
    - AND Operation
    - OR Operation
    - XOR Operation
    - NOT Operation
2. Accumulator
    - Works as D flip flop
    TODO:  Add reset
3. Instruction decoder
    - Takes an instruction
    - Selects one of three operations
        - Store (Probably needs a rework to work as "store word (sw)" instruction)
        - NOP (Do nothing)
        - ALU Operations
4. Program Counter
    - For now works as a counter that increments instruction by 1
    - TODO: Prepare for jumps and branches
        -Add address input and counter input
5. Program Memory
    - Reads the memory in binary form
    - Takes an instruction address form PC
    - Sends the proper instruction to the output
6. Register file
    - Selects proper register and writes the accumulator input to it
    - TODO:
        - ADD RESET
        - Prepare proper memory.mem file
7. Simple top
    - Connects PC and PM
## Not started
1. Whole verification part