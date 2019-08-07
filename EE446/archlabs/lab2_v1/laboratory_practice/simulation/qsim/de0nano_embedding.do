onerror {exit -code 1}
vlib work
vlog -work work de0nano_embedding.vo
vlog -work work deneme.vwf.vt
vsim -novopt -c -t 1ps -L cycloneive_ver -L altera_ver -L altera_mf_ver -L 220model_ver -L sgate_ver -L altera_lnsim_ver work.deneme_vlg_vec_tst -voptargs="+acc"
vcd file -direction de0nano_embedding.msim.vcd
vcd add -internal deneme_vlg_vec_tst/*
vcd add -internal deneme_vlg_vec_tst/i1/*
run -all
quit -f
