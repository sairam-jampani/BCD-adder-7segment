# BCD Adder to Seven Segment Display using Verilog

<p align="left">
  <img src="https://img.shields.io/badge/Design-Verilog-blue.svg" alt="Design Language">
  <img src="https://img.shields.io/badge/Tool-Xilinx%20Vivado%202020.1-orange.svg" alt="Tool">
  <img src="https://img.shields.io/badge/FPGA-Artix--7-brightgreen.svg" alt="FPGA">
  <img src="https://img.shields.io/badge/Design%20Flow-Front--End-brightgreen.svg" alt="Flow">
</p>

---

## 📖 Design Description

### BCD Adder

The BCD Adder performs the addition of two BCD inputs along with an input carry.

The first four slide switches are used for input `A`, the next four slide switches are used for input `B`, and the next switch is used for `cin`.

### Seven Segment Display

The seven-segment display is used to display the BCD result. It consists of 8 cathode connections for the display segments and 4 anode connections for the four digits.

The cathode pins are connected as follows from top to bottom:

| Segment | FPGA Pin |
| :--- | :--- |
| `a` | `G2` |
| `b` | `G1` |
| `c` | `H5` |
| `d` | `H4` |
| `e` | `J5` |
| `f` | `J4` |
| `g` | `H2` |
| `dp` | `H1` |

The four anode pins are assigned from MSB to LSB:

| Digit | FPGA Pin |
| :--- | :--- |
| MSB | `F2` |
| | `E1` |
| | `G5` |
| LSB | `G4` |

The seven-segment display clock is connected to `N11`.

### Verification Strategy

The verification testbench applies different combinations of:

- 4-bit input `A`
- 4-bit input `B`
- Input carry `cin`

The resulting BCD output and seven-segment display signals are observed during simulation.

---

## 🎯 Objectives

- Design a BCD Adder using Verilog HDL.
- Add two BCD inputs with an input carry.
- Convert the BCD result for seven-segment display.
- Verify the design using simulation.
- Analyze the logic diagram, block diagram, and RTL schematic.
- Assign FPGA I/O pins for switches, LEDs, and seven-segment display.
- Implement the design on the EDGE Artix-7 FPGA board.
- Verify the output on the FPGA board.

---

## ⚙️ Target Hardware & Device Specifications

* **Target FPGA Device:** `xc7a35tftg256-1`
* **Target Board:** EDGE Artix-7 FPGA Board

| Component | Nomenclature | Technical Meaning |
| :--- | :--- | :--- |
| **`xc7`** | FPGA Family | **Xilinx 7-Series FPGA** |
| **`a35t`** | Device | **Artix-7 35T FPGA** |
| **`ftg256`** | Package | **256-pin FTG package** |
| **`-1`** | Speed Grade | **Speed Grade -1** |

---

## 🚀 Features

| Signal | Functionality |
| :--- | :--- |
| `A[3:0]` | **Input A:** 4-bit BCD input. |
| `B[3:0]` | **Input B:** 4-bit BCD input. |
| `cin` | **Input Carry:** Carry input to the BCD adder. |
| `sum` | **BCD Sum:** Result of the BCD addition. |
| `seg` | **Seven Segment Output:** Drives the seven-segment display. |

The design includes:

- BCD Addition
- BCD Correction
- Seven Segment Display
- Verilog HDL
- FPGA implementation

---

## 📂 Project Structure

```text
BCD-Adder-Seven-Segment
|
├── bcd_adder.v
├── bcd_to_7segment.v
├── bcd_adder_tb.v
├── Logic Diagram.png
├── Block Diagram.png
├── Slide Switches.png
├── LEDs.png
├── Simulation.png
├── Schematic.png
├── Timing Summary.png
├── Power.png
├── Utilization.png
├── FPGA Board.png
│
└── README.md
```

---

## 🛠️ Tools Used

* **Verilog HDL**
* **Xilinx Vivado 2020.1**
* **Vivado Simulator**
* **EDGE Artix-7 FPGA Board**

---

## 🔄 Verification Flow

1. **Simulation:** Simulate the BCD Adder and seven-segment display logic using the Verilog testbench.
2. **Logic Diagram:** Analyze the logic structure of the BCD Adder and seven-segment display.
3. **Block Diagram:** Analyze the block diagram showing the connection between the inputs, BCD Adder, and display.
4. **Schematic:** Generate and analyze the Vivado schematic.
5. **I/O Planning:** Assign the input signals to the FPGA slide switches and output signals to the LEDs and seven-segment display.
6. **Pin Assignment:** Assign the required FPGA package pins according to the EDGE Artix-7 board.
7. **XDC File:** Save the assigned I/O constraints in the Vivado XDC file and verify that the assignments are saved correctly.
8. **Synthesis:** Run synthesis in Vivado.
9. **Implementation:** Run implementation after successful synthesis.
10. **Bitstream:** Generate the FPGA bitstream.
11. **FPGA Programming:** Program the generated bitstream onto the EDGE Artix-7 FPGA board.
12. **Hardware Verification:** Verify the BCD addition result using the assigned switches, LEDs, and seven-segment display.

---
## 🧱 Block Design & HDL Wrapper

The Vivado Block Design is used to connect the BCD Adder with the seven-segment display logic.

### Creating the Block Design

1. Select **Create Block Design** from the Vivado IP Integrator section.
2. Enter a suitable name for the block design.
3. Set the required connections according to the block diagram.
4. For the required input signals, select **Make External**.
5. Add the `uut` design to the block design.
6. Add the `segment` module for the seven-segment display.
7. Connect the modules according to the block diagram.
8. Select **Regenerate Layout** to arrange the blocks.
9. Select **Validate Design** to check the block design connections.
10. Click on the block design name.
11. Select **Create HDL Wrapper**.
12. Select **Let Vivado manage wrapper and auto-update**.
13. Set the generated HDL wrapper as the **Top** module.
14. The design can now be **Elaborated Design** to view the complete block-level implementation.

### I/O Pin Assignment

For 4-bit switch operations, the pins are assigned from right to left.

The rightmost/top-side pin is considered the **LSB**, while the fourth/bottom-side pin is considered the **MSB**.

| Bit | Position |
| :--- | :--- |
| `bit[0]` | Rightmost / first pin |
| `bit[1]` | Second pin |
| `bit[2]` | Third pin |
| `bit[3]` | Fourth pin / MSB |

The first four switches are used for `A[3:0]`, the next four switches are used for `B[3:0]`, and the next switch is used for `cin`.

The output signals are connected to the LEDs and seven-segment display according to the assigned FPGA pins.

### Slide Switches

The slide switches are used as the **digital inputs** to provide the BCD values and input carry to the FPGA design.

### LEDs

The LEDs are used to display the **digital output signals** from the FPGA.

### Seven Segment Display

The seven-segment display contains **8 cathode pins** and **4 anode pins** for its four digits.

**Cathode pins:**

| Position | Pin |
| :--- | :--- |
| 1 | `G2` |
| 2 | `G1` |
| 3 | `H5` |
| 4 | `H4` |
| 5 | `J5` |
| 6 | `J4` |
| 7 | `H2` |
| 8 | `H1` |

**Anode pins:**

| Digit | Pin |
| :--- | :--- |
| MSB | `F2` |
| | `E1` |
| | `G5` |
| LSB | `G4` |

The seven-segment display clock is connected to `N11`.

---

## 📊 Simulation Results

The simulation verifies the BCD addition for the applied input values.

### Simulation Waveform

<img width="1920" height="1080" alt="Simulation" src="https://github.com/user-attachments/assets/cc789311-6805-4fbf-b015-83da33b4ad15" />


The simulation shows the applied BCD inputs, input carry, BCD result, and seven-segment display signals.

---

## 🌊 Waveform Verification

The waveform is used to observe the BCD inputs, input carry, BCD result, and seven-segment display signals during simulation.

The waveform verifies:

- Correct `A` input
- Correct `B` input
- Correct `cin` operation
- Correct BCD addition
- Correct seven-segment output

---

## 🧩 Logic Diagram

<img width="1003" height="676" alt="Logic Diagram" src="https://github.com/user-attachments/assets/b7f799bc-0612-4de7-865c-384416435289" />


The logic diagram shows the BCD addition and seven-segment display conversion logic.

---

## 🧱 Block Diagram

<img width="1920" height="1080" alt="Block Diagram" src="https://github.com/user-attachments/assets/7f5c7963-5d91-4906-ad12-399e9cee7a7f" />

The block diagram shows the flow of the BCD inputs through the BCD Adder and to the output display.

---

## 🔧 RTL Schematic

<img width="1920" height="1080" alt="RTL_Schematic" src="https://github.com/user-attachments/assets/b26b58c5-f1ca-4a44-be69-a2afaf386bd3" />


The RTL schematic generated in Vivado shows the implemented logic structure of the BCD Adder and seven-segment display.

---

## ⏱️ Timing Summary

<img width="1920" height="1080" alt="Timing" src="https://github.com/user-attachments/assets/586efcc9-6b20-45d6-863e-82fb4dee79f4" />


The timing summary generated by Vivado provides the timing information of the implemented design.

---

## ⚡ Power Analysis

<img width="1920" height="1080" alt="Power" src="https://github.com/user-attachments/assets/33b059cf-5bd3-438d-ab3e-e8c9a4bae0df" />


The Vivado power report provides the power information for the implemented design.

---

## 📈 Utilization Report

<img width="1920" height="1080" alt="Utilization" src="https://github.com/user-attachments/assets/41e63653-db70-40c4-bf67-7d6d469414a8" />


The utilization report shows the FPGA resources used by the implemented design.

---

## 💻 FPGA Implementation

<img width="1200" height="1600" alt="FPGA" src="https://github.com/user-attachments/assets/636f8829-a594-40e8-9d58-feff20c81dd1" />


The BCD Adder is programmed onto the EDGE Artix-7 FPGA board and verified using the slide switches, LEDs, and seven-segment display.

### Hardware Verification

The input values applied through the FPGA board are:

| Input | Value |
| :--- | :--- |
| `A` | `0011` |
| `B` | `0011` |
| `cin` | `1` |

The addition is:

```text
  0011
+ 0011
+    1
------
  0111
```

Therefore:

```text
BCD Output = 0111
Decimal Value = 7
```

The corresponding output is displayed on the seven-segment display and output LEDs as shown on the FPGA board.

---

## 🎯 Learning Outcomes

* Understanding BCD addition.
* Implementing BCD arithmetic using Verilog HDL.
* Understanding BCD correction logic.
* Interfacing a seven-segment display with an FPGA.
* Developing and simulating a Verilog testbench.
* Generating and analyzing an RTL schematic using Vivado.
* Performing FPGA I/O planning and pin assignment.
* Running synthesis and implementation in Vivado.
* Generating a bitstream and programming an Artix-7 FPGA board.

---

## 📱 Applications

- Digital Arithmetic Circuits
- Calculator Systems
- Digital Displays
- FPGA-Based Digital Systems
- Embedded Digital Systems

---

## 📫 Connect with Me

- **GitHub:** [github.com/sairam-jampani](https://github.com/sairam-jampani)
- **LinkedIn:** [linkedin.com/in/sai-ram-jampani04](https://linkedin.com/in/sai-ram-jampani04/)

<br>

⭐ *If you found this project useful, consider giving it a star.*
