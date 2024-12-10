onbreak {quit -force}
onerror {quit -force}

asim +access +r +m+dds_compiler_1 -L xpm -L xil_defaultlib -L unisims_ver -L unimacro_ver -L secureip -O5 xil_defaultlib.dds_compiler_1 xil_defaultlib.glbl

set NumericStdNoWarnings 1
set StdArithNoWarnings 1

do {wave.do}

view wave
view structure

do {dds_compiler_1.udo}

run -all

endsim

quit -force
