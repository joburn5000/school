transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 4/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 4/quartus code/control.sv}
vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 4/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 4/quartus code/lookahead_adder.sv}
vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 4/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 4/quartus code/register_unit.sv}
vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 4/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 4/quartus code/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 4/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 4/quartus code/multiplier.sv}

vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 4/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 4/quartus code/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 2500 ns
