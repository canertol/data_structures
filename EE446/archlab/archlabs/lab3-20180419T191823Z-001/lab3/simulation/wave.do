onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate /Test_singleCycle/DUT/dmem/RAM
add wave -noupdate -expand /Test_singleCycle/DUT/arm1/d1/regFile/rf
add wave -noupdate -divider sadasda
add wave -noupdate -format Literal -radix binary /Test_singleCycle/DUT/clk
add wave -noupdate -format Literal -radix binary /Test_singleCycle/DUT/rst
add wave -noupdate -format Literal -radix binary /Test_singleCycle/DUT/CO
add wave -noupdate /Test_singleCycle/DUT/arm1/WriteData
add wave -noupdate -format Literal -radix binary /Test_singleCycle/DUT/OVF
add wave -noupdate -format Literal -radix binary /Test_singleCycle/DUT/Z
add wave -noupdate -format Literal -radix binary /Test_singleCycle/DUT/N
add wave -noupdate -radix binary /Test_singleCycle/DUT/Flags
add wave -noupdate -radix binary /Test_singleCycle/DUT/ReadData
add wave -noupdate -radix binary -childformat {{{/Test_singleCycle/DUT/Instr[31]} -radix binary} {{/Test_singleCycle/DUT/Instr[30]} -radix binary} {{/Test_singleCycle/DUT/Instr[29]} -radix binary} {{/Test_singleCycle/DUT/Instr[28]} -radix binary} {{/Test_singleCycle/DUT/Instr[27]} -radix binary} {{/Test_singleCycle/DUT/Instr[26]} -radix binary} {{/Test_singleCycle/DUT/Instr[25]} -radix binary} {{/Test_singleCycle/DUT/Instr[24]} -radix binary} {{/Test_singleCycle/DUT/Instr[23]} -radix binary} {{/Test_singleCycle/DUT/Instr[22]} -radix binary} {{/Test_singleCycle/DUT/Instr[21]} -radix binary} {{/Test_singleCycle/DUT/Instr[20]} -radix binary} {{/Test_singleCycle/DUT/Instr[19]} -radix binary} {{/Test_singleCycle/DUT/Instr[18]} -radix binary} {{/Test_singleCycle/DUT/Instr[17]} -radix binary} {{/Test_singleCycle/DUT/Instr[16]} -radix binary} {{/Test_singleCycle/DUT/Instr[15]} -radix binary} {{/Test_singleCycle/DUT/Instr[14]} -radix binary} {{/Test_singleCycle/DUT/Instr[13]} -radix binary} {{/Test_singleCycle/DUT/Instr[12]} -radix binary} {{/Test_singleCycle/DUT/Instr[11]} -radix binary} {{/Test_singleCycle/DUT/Instr[10]} -radix binary} {{/Test_singleCycle/DUT/Instr[9]} -radix binary} {{/Test_singleCycle/DUT/Instr[8]} -radix binary} {{/Test_singleCycle/DUT/Instr[7]} -radix binary} {{/Test_singleCycle/DUT/Instr[6]} -radix binary} {{/Test_singleCycle/DUT/Instr[5]} -radix binary} {{/Test_singleCycle/DUT/Instr[4]} -radix binary} {{/Test_singleCycle/DUT/Instr[3]} -radix binary} {{/Test_singleCycle/DUT/Instr[2]} -radix binary} {{/Test_singleCycle/DUT/Instr[1]} -radix binary} {{/Test_singleCycle/DUT/Instr[0]} -radix binary}} -subitemconfig {{/Test_singleCycle/DUT/Instr[31]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[30]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[29]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[28]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[27]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[26]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[25]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[24]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[23]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[22]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[21]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[20]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[19]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[18]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[17]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[16]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[15]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[14]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[13]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[12]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[11]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[10]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[9]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[8]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[7]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[6]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[5]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[4]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[3]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[2]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[1]} {-height 15 -radix binary} {/Test_singleCycle/DUT/Instr[0]} {-height 15 -radix binary}} /Test_singleCycle/DUT/Instr
add wave -noupdate -radix binary /Test_singleCycle/DUT/AluResult
add wave -noupdate -radix binary /Test_singleCycle/DUT/PC
add wave -noupdate -format Literal -radix binary /Test_singleCycle/DUT/WriteEnable
add wave -noupdate /Test_singleCycle/DUT/arm1/d1/AluResult
add wave -noupdate /Test_singleCycle/DUT/dmem/adress
add wave -noupdate /Test_singleCycle/DUT/dmem/RAM
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {296 ps} 0}
quietly wave cursor active 1
configure wave -namecolwidth 104
configure wave -valuecolwidth 219
configure wave -justifyvalue left
configure wave -signalnamewidth 1
configure wave -snapdistance 10
configure wave -datasetprefix 0
configure wave -rowmargin 4
configure wave -childrowmargin 2
configure wave -gridoffset 0
configure wave -gridperiod 1
configure wave -griddelta 40
configure wave -timeline 0
configure wave -timelineunits sec
update
WaveRestoreZoom {207 ps} {516 ps}
