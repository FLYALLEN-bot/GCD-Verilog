# 🔢 GCD Calculator — Verilog HDL

> 🧮 8-bit Greatest Common Divisor (GCD) calculator using the Euclidean subtraction algorithm, implemented in Verilog and verified with ModelSim.

---

## 📖 Overview

This project implements a **hardware GCD calculator** that computes the Greatest Common Divisor of two 8-bit unsigned integers. The design follows the classic **FSM + Datapath** architecture pattern, using repeated subtraction (Euclidean algorithm) to find the result.

## ✨ Features

- 🧠 **FSM-based Controller** — 13-state finite state machine for sequencing operations
- 🔧 **Modular Datapath** — clean separation of registers, subtractors, comparators, and muxes
- 🔢 **8-bit Arithmetic** — supports unsigned 8-bit input operands
- ✅ **Testbench Included** — ready-to-simulate testbench with ModelSim
- 🎯 **Synchronous Reset** — predictable startup behavior
- ⏱️ **50 MHz Clock** — 20ns clock period in simulation

## 🏗️ Architecture

```
┌─────────────────────────────────────────────┐
│                  GCD (Top)                  │
│                                             │
│  ┌─────────────┐       ┌─────────────────┐  │
│  │  Controller  │◄─────►│    DataPath     │  │
│  │  (FSM 13S)  │       │                 │  │
│  │             │       │  ┌───────────┐  │  │
│  │  go_i ──►   │       │  │  DataReg  │  │  │
│  │  reset ──►  │       │  │  (x, y)   │  │  │
│  │  clk ──►    │       │  ├───────────┤  │  │
│  │             │       │  │ 8-bit Sub │  │  │
│  │  done_o ◄── │       │  │ (x-y,y-x)│  │  │
│  └─────────────┘       │  ├───────────┤  │  │
│                        │  │ Comparator│  │  │
│                        │  │ (<, ≠)    │  │  │
│                        │  └───────────┘  │  │
│                        └─────────────────┘  │
└─────────────────────────────────────────────┘
```

## 📁 File Structure

| File | Description |
|------|-------------|
| `GCD.v` | 🏠 Top-level module connecting Controller and DataPath |
| `Controller.v` | 🎛️ FSM controller with 13 states (idle, load, compare, subtract, done) |
| `DataPath.v` | 🔩 Datapath with registers, subtractors, comparators, and muxes |
| `DataReg.v` | 📦 8-bit data register with load enable |
| `eightBitAdder.v` | ➕ 8-bit ripple-carry adder (built from full adders) |
| `eightBitSubtracter.v` | ➖ 8-bit subtracter using 2's complement |
| `fulladder.v` | 🔹 1-bit full adder (gate-level) |
| `mux2.v` | 🔀 2-to-1 multiplexer |
| `lessThan.v` | 📐 8-bit less-than comparator |
| `notEqual.v` | 📐 8-bit not-equal comparator |
| `GCD_tb.v` | 🧪 Testbench — tests GCD(6,9)=3 and GCD(12,8)=4 |

## 🚀 How to Run (ModelSim)

1. 📂 Open ModelSim and navigate to the project directory
2. 📋 Compile all source files:
   ```tcl
   vlog *.v
   ```
3. ▶️ Run the simulation:
   ```tcl
   vsim work.GCD_tb
   run 1000ns
   ```
4. 📊 Add signals to wave viewer to observe results

## 🧪 Test Cases

| Test | x | y | Expected GCD |
|------|---|---|-------------|
| 1️⃣ | 6 | 9 | **3** |
| 2️⃣ | 12 | 8 | **4** |

## ⚙️ Algorithm

The GCD is computed using the **Euclidean subtraction algorithm**:

```
while (x ≠ y):
    if (x < y):
        y = y - x
    else:
        x = x - y
GCD = x
```

## 🛠️ Tools Used

- 🔧 **Verilog HDL** — Hardware description language
- 🔬 **ModelSim** — Simulation and verification
- 📐 **FSM Design** — Mealy/Moore hybrid state machine

## 📜 License

This project is for educational purposes. 📚

---

⭐ If you found this project helpful, please give it a star!
