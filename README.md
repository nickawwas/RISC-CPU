# RISC CPU

Designed and Implemented a RISC CPU Based Upon MIPS Architecture

- Simulated All Components using Modelsim
- Synthesized and Implemented All Components using Vivado
- Developed 4-Bit Board Wrappers to Run All Components on Nexys A7 Board

## Arithmetic and Logic Unit (ALU)

- Implemented a 32-Bit ALU
  - Perform Operation on X and Y
    - X: Rs Contents from Regfile
    - Y: Rt Contents or Extended Immediate Data from Regfile and Sign Extend Respectively
  - W/ Logic Unit to Handle AND, OR, XOR, and NOR
  - W/ Add Sub Block to Perform Add (+) and Sub (-)
  - W/ Zero and Overflow Detection

## Register File

- Implemented a 32 X 32-Bit Register File
  - W/ Asychronous Reset to Reset All 32 Registers
  - W/ Synchronous Write Using Rt or Rd Address from I Cache as Write Address
  - W/ Asynchronous Read Using Rs and Rt Address from I Cache as Read Addresses

## Next Address Unit

- Implemented a 32-Bit Next Address Unit
  - W/ No Branching for Straightline Instructions
  - W/ Jump Register Using Rs Contents from Reg File
  - W/ Jump Instruction Extended Target Address from I Cache
  - W/ Conditional Jumps Checking Branching Condition to Perfom Branch

## Data Cache (D Cache)

- Implemented a 32 X 32-Bit RAM Data Cache
  - W/ Asychronous Reset to Reset All 32 Registers
  - W/ Synchronous Write Using ALU Output As Write Address
  - W/ Asynchronous Read Using Rt Contents from Reg File as Read Address

## Instruction Cache (I Cache)

- Implemented a ROM Instruction Cache
  - Stores Program Machine Code
  - W/ PC Output as Instruction Address to Obtain Next Instruction

## Sign Extend

- Implemented a 16-bit to 32-bit Sign Extend
  - W/ Immediate Data Input from Instruction Cache
    - Extending w/ MSB for Logical Instructions
    - Padding Lower w/ 0s for Load Upper Immediate
    - Padding Upper w/ 0s for Arithmetic and Set Less Immediate Instructions

## Program Counter

- Implemented a 32-Bit Program Counter (PC)
  - Stores Current Instruction Address from Next Address Output

## Data Path

- Implemented the Data Path for a 32-Bit CPU
  - Integrated All Components into Datapath
  - Write Back to Reg File Either Data Cache or ALU Output

## Control Unit

- Implemented a Control Unit
  - Sets All 10 Control Bits
  - W/ Op Code and Instruction Field from I Cache to Identify Instruction

## Reduced Instruction Set Computer (RISC) CPU

- Integrated All Components to Implement a Fully Functional 32-Bit CPU
  - Integrated Datapath with Control Unit
  - Performed System Testing with Multiple Programs
