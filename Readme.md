## Testing PLLs on T120F576 FPGA

This project is a **minimal Verilog design** created to test and validate the **PLL clock outputs** on the Efinix Trion T120F576 FPGA (custom board). It uses a simple counter-based approach to verify that different PLL-generated clock branches are toggling as expected.

---

### **1. Project Overview**

* The design instantiates a PLL with multiple clock outputs (BR0, BR1, BR2, …).
* Each clock output drives a **counter** that increments on every rising edge.
* The counter values are observed via:

  * **Debugger** (Efinity Debugger / JTAG),
  * or connected to LEDs/UART (if available) for activity indication.

This project was primarily used to debug BR0 clock routing issues and verify minimum clock frequency behavior.

---

### **2. Why this project exists**

While debugging LPDDR3 initialization issues, we suspected clock distribution problems.
This test design helped confirm:

* **BR0 clock input requires a minimum valid frequency (\~25 MHz).**

  * BR0 fails to toggle counters at 10 MHz but works at 50 MHz.
* Other branches (BR1, BR2, etc.) are less restrictive and work at lower frequencies.

By isolating the PLL and counters from the full system, we were able to rule out logic-level issues.

---

### **3. File Structure**

```
testing_PLLs/
├── top.v                 # Top-level Verilog (instantiates PLL + counters)
├── test_counter.v        # Simple counter module (counts clock edges)
├── ip/                   # Efinity-generated PLL IP and config files
├── *.sdc / *.xml         # Efinity constraints and project files
├── work_syn, work_pnr    # Synth/P&R work directories
└── efinity_dbg.jtag.*    # Debugger session logs
```

**Key files to look at:**

* `top.v` – Configures PLL outputs and connects each to a counter instance.
* `test_counter.v` – Counter logic for activity detection.

---

### **4. How to Build & Test**

1. Open the project in **Efinity 2024.1 (or later)**.
2. Run synthesis, P\&R, and generate the bitstream.
3. Program the FPGA using the `.bit` file.
4. Observe the counters:

   * Through the Efinity Debugger (`efinity_dbg`) via JTAG, or
   * Map them to LEDs/UART for visible output.

---

### **5. Lessons Learned**

* **BR0 is sensitive to input frequency**:

  * At 10 MHz, counters connected to BR0 did not increment (clock was gated).
  * At 50 MHz, counters incremented as expected.
* Other branches (BR1, BR2) counted properly at both 10 MHz and 50 MHz.

This aligns with the Efinix Trion minimum frequency requirements for BR0 (≥25 MHz).

---

### **6. Future Improvements**

* Add PLL **lock status** indicators to quickly confirm PLL initialization.
* Route counter MSBs to on-board LEDs for visual verification without debugger.
* Parameterize the number of counters and clock branches for easier scaling.

---

### **7. License**

This project is free to use and modify for testing and educational purposes.

