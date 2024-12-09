onerror {resume}
quietly WaveActivateNextPane {} 0
add wave -noupdate -expand -group RF /top/dut/rf/we
add wave -noupdate -expand -group RF /top/dut/rf/accumulator_input
add wave -noupdate -expand -group RF /top/dut/rf/register_value
add wave -noupdate -expand -group RF /top/dut/rf/reg0
add wave -noupdate -expand -group RF /top/dut/rf/reg1
add wave -noupdate -expand -group ALU /top/dut/alu/i_1
add wave -noupdate -expand -group ALU /top/dut/alu/i_2
add wave -noupdate -expand -group ALU /top/dut/alu/o_main
add wave -noupdate -expand -group ACU /top/dut/acu/ce
add wave -noupdate -expand -group ACU /top/dut/acu/input_from_alu
add wave -noupdate -expand -group ACU /top/dut/acu/output_main
TreeUpdate [SetDefaultTree]
WaveRestoreCursors {{Cursor 1} {0 ns} 0}
quietly wave cursor active 0
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
configure wave -timelineunits ns
update
WaveRestoreZoom {150 ns} {1150 ns}
