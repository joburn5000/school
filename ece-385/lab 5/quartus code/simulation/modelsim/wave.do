onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/SW
add wave -noupdate /testbench/Clk
add wave -noupdate /testbench/Run
add wave -noupdate /testbench/Continue
add wave -noupdate /testbench/LED
add wave -noupdate /testbench/HEX0
add wave -noupdate /testbench/HEX1
add wave -noupdate /testbench/HEX2
add wave -noupdate /testbench/HEX3
add wave -noupdate /testbench/slc3_testtop/slc/SW
add wave -noupdate /testbench/slc3_testtop/slc/Clk
add wave -noupdate /testbench/slc3_testtop/slc/Reset
add wave -noupdate /testbench/slc3_testtop/slc/Run
add wave -noupdate /testbench/slc3_testtop/slc/Continue
add wave -noupdate /testbench/slc3_testtop/slc/LED
add wave -noupdate /testbench/slc3_testtop/slc/Data_from_SRAM
add wave -noupdate /testbench/slc3_testtop/slc/OE
add wave -noupdate /testbench/slc3_testtop/slc/WE
add wave -noupdate /testbench/slc3_testtop/slc/HEX0
add wave -noupdate /testbench/slc3_testtop/slc/HEX1
add wave -noupdate /testbench/slc3_testtop/slc/HEX2
add wave -noupdate /testbench/slc3_testtop/slc/HEX3
add wave -noupdate /testbench/slc3_testtop/slc/ADDR
add wave -noupdate /testbench/slc3_testtop/slc/Data_to_SRAM
add wave -noupdate /testbench/slc3_testtop/slc/MAR
add wave -noupdate /testbench/slc3_testtop/slc/MDR
add wave -noupdate /testbench/slc3_testtop/slc/IR
add wave -noupdate /testbench/slc3_testtop/slc/LD_MAR
add wave -noupdate /testbench/slc3_testtop/slc/LD_MDR
add wave -noupdate /testbench/slc3_testtop/slc/LD_IR
add wave -noupdate /testbench/slc3_testtop/slc/LD_BEN
add wave -noupdate /testbench/slc3_testtop/slc/LD_CC
add wave -noupdate /testbench/slc3_testtop/slc/LD_REG
add wave -noupdate /testbench/slc3_testtop/slc/LD_PC
add wave -noupdate /testbench/slc3_testtop/slc/LD_LED
add wave -noupdate /testbench/slc3_testtop/slc/GatePC
add wave -noupdate /testbench/slc3_testtop/slc/GateMDR
add wave -noupdate /testbench/slc3_testtop/slc/GateALU
add wave -noupdate /testbench/slc3_testtop/slc/GateMARMUX
add wave -noupdate /testbench/slc3_testtop/slc/SR2MUX
add wave -noupdate /testbench/slc3_testtop/slc/ADDR1MUX
add wave -noupdate /testbench/slc3_testtop/slc/MARMUX
add wave -noupdate /testbench/slc3_testtop/slc/BEN
add wave -noupdate /testbench/slc3_testtop/slc/MIO_EN
add wave -noupdate /testbench/slc3_testtop/slc/DRMUX
add wave -noupdate /testbench/slc3_testtop/slc/SR1MUX
add wave -noupdate /testbench/slc3_testtop/slc/PCMUX
add wave -noupdate /testbench/slc3_testtop/slc/ADDR2MUX
add wave -noupdate /testbench/slc3_testtop/slc/ALUK
add wave -noupdate /testbench/slc3_testtop/slc/MDR_In
add wave -noupdate /testbench/slc3_testtop/slc/PC
add wave -noupdate /testbench/slc3_testtop/slc/PCMUX_out
add wave -noupdate /testbench/slc3_testtop/slc/ALU
add wave -noupdate /testbench/slc3_testtop/slc/BUS
add wave -noupdate /testbench/slc3_testtop/slc/ALU_in
add wave -noupdate /testbench/slc3_testtop/slc/ADDR_sum
add wave -noupdate /testbench/slc3_testtop/slc/MDR_in
add wave -noupdate /testbench/slc3_testtop/slc/GATES
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/Clk
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/Reset
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/Run
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/Continue
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/Opcode
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/IR_5
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/IR_11
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/BEN
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/LD_MAR
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/LD_MDR
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/LD_IR
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/LD_BEN
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/LD_CC
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/LD_REG
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/LD_PC
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/LD_LED
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/GatePC
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/GateMDR
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/GateALU
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/GateMARMUX
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/PCMUX
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/DRMUX
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/SR1MUX
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/SR2MUX
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/ADDR1MUX
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/ADDR2MUX
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/ALUK
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/Mem_OE
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/Mem_WE
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/State
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/Next_state
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/Clk
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/Reset
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/ADDR
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/OE
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/WE
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/Switches
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/Data_from_CPU
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/Data_from_SRAM
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/Data_to_CPU
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/Data_to_SRAM
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/HEX0
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/HEX1
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/HEX2
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/HEX3
add wave -noupdate /testbench/slc3_testtop/slc/memory_subsystem/hex_data
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {1162 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 150
configure wave -valuecolwidth 100
configure wave -justifyvalue left
configure wave -signalnamewidth 0
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits ps
update
WaveRestoreZoom {0 ps} {3198 ps}