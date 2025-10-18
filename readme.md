# 🕒 12-Hour Digital Clock (Verilog)

This project implements a **12-hour digital clock** using Verilog HDL.  
It counts hours, minutes, and seconds in **BCD format** and toggles **AM/PM**.

## ⚙️ Tools Used
- Icarus Verilog (simulation)
- GTKWave (waveform viewer)
- Yosys (synthesis)
- Netlistsvg (schematic)

## 🧩 Files
| File | Description |
|------|--------------|
| `digclk12h.v` | Main Verilog design |
| `tb_digclk12h.v` | Testbench |
| `digclk12h.json` | Synthesized JSON (Yosys) |
| `digclk12h.svg` | Circuit schematic |
| `waveform.vcd` | Simulation waveform |

## 💻 Run Simulation
```bash
iverilog -o digclk12h digclk12h.v tb_digclk12h.v
vvp digclk12h
xdg-open waveform.vcd

--- 12-Hour Digital Clock Simulation ---

Time: 11:59:58 AM
Time: 11:59:59 AM
Time: 12:00:00 PM
Time: 12:00:01 PM
...
Time: 11:59:59 PM
Time: 12:00:00 AM
