onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/slc3_testtop/SW
add wave -noupdate /testbench/slc3_testtop/Clk
add wave -noupdate /testbench/slc3_testtop/Run
add wave -noupdate /testbench/slc3_testtop/Continue
add wave -noupdate -radix hexadecimal /testbench/slc3_testtop/slc/IR
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/State
add wave -noupdate -radix decimal /testbench/slc3_testtop/slc/PC
add wave -noupdate /testbench/slc3_testtop/slc/hex_4
add wave -noupdate -expand /testbench/slc3_testtop/slc/registers/R
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {963536 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 207
configure wave -valuecolwidth 182
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
WaveRestoreZoom {0 ps} {5775 ns}
