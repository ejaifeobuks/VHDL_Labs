# VHDL_Labs

This repository contains VHDL source code and projects from my school's Digital Systems Laboratory coursework. The labs focus on digital logic design concepts and FPGA implementation using like Xilinx Vivao.

## Repository Structure

```
VHDL_Labs/
├── Lab1/
│   ├── lab1.vhd      # Boolean logic implementation (SOP/POS forms)
│   └── XDC.xdc       # Nexys4 DDR pin constraints
├── Lab2/
│   ├── lab2.vhd      # Logic gates using NAND/NOR, MUX, and decoder
│   └── XDC.xdc       # Nexys4 DDR pin constraints
└── README.md         # This file
```

## Lab Descriptions

### Lab1 - Boolean Logic Forms

**File**: `Lab1/lab1.vhd`

Implements Boolean function representations:

- **Inputs**: x, y, z (3-bit logic inputs)
- **Outputs**:
  - `CSOP`: Canonical Sum of Products form
  - `CPOS`: Canonical Product of Sums form
  - `RSOP`: Reduced Sum of Products form
  - `RPOS`: Reduced Product of Sums form

Target: Nexys4 DDR board (switches SW[0-2] → inputs z,y,x; LEDs for outputs)

### Lab2 - Logic Implementation Methods

**File**: `Lab2/lab2.vhd`

Demonstrates different logic implementation approaches:

- **Inputs**: x, y, z (3-bit logic inputs)
- **Outputs**:
  - `f_nand`: Function using only NAND gates
  - `f_nor`: Function using only NOR gates
  - `f_mux`: Function using multiplexer
  - `f_dec`: Function using decoder

## Development Tools

### Code Editing

**VS Code** (recommended for editing only):

- Install VHDL Language Support extension for syntax highlighting
- Install Tcl extension for `.xdc` constraint file highlighting
- VS Code provides excellent text editing but VHDL simulation and synthesis require professional tools

### Simulation and Synthesis

**Required Professional Tools**:

- **Xilinx Vivado** - Primary tool for FPGA synthesis, implementation, and programming
- **ModelSim** - Industry-standard VHDL/Verilog simulator for behavioral verification
- **Quartus Prime** (Intel/Altera alternative)

**Note**: VHDL code must be simulated and synthesized using professional EDA tools. VS Code serves only as a text editor.

## FPGA Implementation

### Target Hardware

- **Boards**:
  - Nexys4 DDR (Artix-7 FPGA)
  - NEXYS A7 100T by Digilent (Artix-7 FPGA)
- **Tools**: Xilinx Vivado, ModelSim

### Pin Assignments

Both labs use the same input mapping (defined in `XDC.xdc`):

- `z` ← SW[0] (switch 0)
- `y` ← SW[1] (switch 1)
- `x` ← SW[2] (switch 2)

Output pins vary by lab - see individual `.xdc` files for LED assignments.

### Vivado Workflow

1. Create new project in Vivado
2. Add the `.vhd` file as design source
3. Add the `.xdc` file as constraints
4. Run synthesis and implementation
5. Generate bitstream and program the FPGA

## File Types Reference

- **`.vhd`**: VHDL source files (hardware description)
- **`.xdc`**: Xilinx Design Constraints (pin assignments, timing, I/O standards)

## Getting Started

1. **Code Editing**: Use VS Code with VHDL extensions for syntax-highlighted editing
2. **Simulation**: Import VHDL files into ModelSim or Vivado for behavioral simulation
3. **FPGA Implementation**: Use Xilinx Vivado for synthesis, implementation, and programming
4. **Hardware Testing**: Deploy to Nexys4 DDR or NEXYS A7 100T development boards

## Notes

- Constraint files are compatible with both Nexys4 DDR and NEXYS A7 100T boards
- Both labs demonstrate different implementation approaches for Boolean functions
- Always simulate thoroughly in ModelSim/Vivado before hardware deployment
- This repository represents coursework from Digital Systems Laboratory class
