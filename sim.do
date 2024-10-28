vlog -sv /home/student/MG/WdPM/design/alu_pkg.sv /home/student/MG/WdPM/design/alu.sv /home/student/MG/WdPM/verif/alu_tb/top.sv /home/student/MG/WdPM/design/accumulator.sv
vsim -voptargs="+acc" top
add wave -r /*
run -all
