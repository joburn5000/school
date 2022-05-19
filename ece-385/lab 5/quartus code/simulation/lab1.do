onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /testbench/Clk
add wave -noupdate /testbench/Run
add wave -noupdate /testbench/Continue
add wave -noupdate /testbench/slc3_testtop/slc/OE
add wave -noupdate /testbench/slc3_testtop/slc/IR
add wave -noupdate /testbench/slc3_testtop/slc/LD_MAR
add wave -noupdate /testbench/slc3_testtop/slc/state_controller/Next_state
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {359968 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 464
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
WaveRestoreZoom {0 ps} {1050 ns}
