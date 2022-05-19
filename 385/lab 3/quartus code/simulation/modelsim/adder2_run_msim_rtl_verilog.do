transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 3/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 3/quartus code/router.sv}
vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 3/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 3/quartus code/ripple_adder.sv}
vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 3/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 3/quartus code/reg_17.sv}
vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 3/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 3/quartus code/lookahead_adder.sv}
vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 3/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 3/quartus code/HexDriver.sv}
vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 3/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 3/quartus code/control.sv}
vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 3/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 3/quartus code/adder2.sv}

vlog -sv -work work +incdir+C:/Users/beallis3/Desktop/ece385-sp2022/lab\ 3/quartus\ code {C:/Users/beallis3/Desktop/ece385-sp2022/lab 3/quartus code/testbench.sv}

vsim -t 1ps -L altera_ver -L lpm_ver -L sgate_ver -L altera_mf_ver -L altera_lnsim_ver -L fiftyfivenm_ver -L rtl_work -L work -voptargs="+acc"  testbench

add wave *
view structure
view signals
run 1000 ns
