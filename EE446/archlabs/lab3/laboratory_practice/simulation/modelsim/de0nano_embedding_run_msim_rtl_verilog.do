transcript on
if {[file exists rtl_work]} {
	vdel -lib rtl_work -all
}
vlib rtl_work
vmap work rtl_work

vlog -vlog01compat -work work +incdir+C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice {C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice/mux_2to1.v}
vlog -vlog01compat -work work +incdir+C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice {C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice/constant_value_generator.v}
vlog -vlog01compat -work work +incdir+C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice {C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice/alu.v}
vlog -vlog01compat -work work +incdir+C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice {C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice/registerfile.v}
vlog -vlog01compat -work work +incdir+C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice {C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice/adder.v}
vlog -vlog01compat -work work +incdir+C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice {C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice/extend.v}
vlog -vlog01compat -work work +incdir+C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice {C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice/datamem.v}
vlog -vlog01compat -work work +incdir+C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice {C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice/instmem.v}
vlog -vlog01compat -work work +incdir+C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice {C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice/pcreg.v}
vlog -vlog01compat -work work +incdir+C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice {C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice/shifter_arm.v}
vlog -vlog01compat -work work +incdir+C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice {C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice/singlearm_decoder_controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice {C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice/singlearm_conditional_controller.v}
vlog -vlog01compat -work work +incdir+C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice {C:/Users/KaanFurkan/Desktop/lab3/laboratory_practice/singlecyclearm.v}
