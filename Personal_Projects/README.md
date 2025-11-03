# 2x2 Binary Multiplier (Nexys A7)

This personal FPGA project implements a 2-bit by 2-bit binary multiplier on a Digilent Nexys A7-100T board. The design is written in VHDL and builds the multiplier out of reusable full-adder logic so you can visualize the computed product directly on the onboard LEDs.

## Features

- Purely combinational 2×2 unsigned multiplier (no clock required)
- Built from a reusable single-bit full adder component
- Mapped to Nexys A7 switches and LEDs via an editable XDC
- Immediate visual feedback on LEDs for all 16 input combinations

## Repository layout

- `full_add.vhd` – single-bit full adder used throughout the design.
- `top.vhd` – combinational 2x2 multiplier that instantiates `full_add` stages and exposes the four output bits (`S_0`, `S_1`, `S_2`, `C_2`).
- `Nexys-A7-100T-Master.xdc` – constraint template with the relevant pin assignments for switches and LEDs.
- `schematic.pdf` – high-level schematic/block diagram of the multiplier datapath.

## Hardware requirements

- Digilent Nexys A7-100T (or Nexys 4 DDR) FPGA development board.
- Xilinx Vivado (2020.1 or newer recommended).
- Micro-USB cable and power source for the board.

## Vivado project setup

1. Start Vivado and create a new RTL project that targets the Nexys A7-100T device.
2. Add `full_add.vhd` and `top.vhd` to the project.
3. Import `Nexys-A7-100T-Master.xdc` and uncomment/rename the pin constraints that correspond to the signals used in `top` (see the table below).
4. Set `top` as the top module.
5. Run synthesis, implementation, and generate the bitstream.
6. Program the board via the Hardware Manager.

## I/O mapping

The constraint file already maps the core signals to convenient board peripherals. Make sure the port names stay synchronized with the VHDL entity you promote to the top level.

| Signal                     | Purpose                                     | Suggested board resource                 |
| -------------------------- | ------------------------------------------- | ---------------------------------------- |
| `a`, `b`                   | First 2-bit operand (`a` = MSB, `b` = LSB)  | `sw[1]`, `sw[0]`                         |
| `c`, `d`                   | Second 2-bit operand (`c` = MSB, `d` = LSB) | `sw[15]`, `sw[14]`                       |
| `S_0`, `S_1`, `S_2`, `C_2` | Multiplier result bits (LSB to MSB)         | `led[0]`, `led[1]`, `led[14]`, `led[15]` |

## Schematic

For a quick visual of the datapath (partial products feeding a ripple of full adders), see the project schematic:

- View: [`schematic.pdf`](./schematic.pdf)

Note: GitHub may not render PDFs inline in all views; open the link to preview or download. If you prefer an inline image in the README, export the schematic to PNG/SVG and reference it (e.g., `docs/2x2-multiplier.png`).

## Using the design

1. Load the bitstream onto the Nexys A7.
2. Set the operand switches (`a b` and `c d`) to select the two 2-bit numbers.
3. Observe the product on the onboard LEDs: bits light up as `C_2  S_2  S_1  S_0` (MSB → LSB). That is, `C_2` is the most significant bit and `S_0` is the least significant bit.

The multiplier is purely combinational, so it reacts immediately to switch changes.

## Simulation and test suggestions

The repository does not currently include a VHDL testbench. To verify the logic before targeting hardware, create a simple testbench that drives all 16 input combinations through the `top` entity and checks the four-bit output against the expected 2x2 multiplication result.

## Possible extensions

- Add switch debouncing or edge-detection logic so operand changes register cleanly.
- Expand the architecture to handle larger operands (e.g., ripple additional `full_add` stages for 4x4 multiplication).
- Integrate a testbench and automated simulation scripts to catch regressions quickly.
