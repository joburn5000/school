onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -radix hexadecimal /testbench/Clk
add wave -noupdate -radix hexadecimal /testbench/Run
add wave -noupdate -radix hexadecimal /testbench/Continue
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/Reset
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/MAR
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/MDR
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/IR
add wave -noupdate /testbench/slc3_testtop/slc/registers/LD_reg
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/LD_MAR
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/LD_MDR
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/LD_IR
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/LD_PC
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/GatePC
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/GateMDR
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/PC
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/BUS
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/state_controller/Mem_OE
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/state_controller/State
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/state_controller/Next_state
add wave -noupdate /testbench/slc3_testtop/slc/registers/R
add wave -noupdate /testbench/slc3_testtop/slc/SW
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {501493 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 359
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
configure wave -timelineunits ns
update
WaveRestoreZoom {0 ps} {1050 ns}
