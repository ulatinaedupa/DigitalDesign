transcript off

vcom ShiftRegister.vhd
vcom ShiftRegisterTestBench.vhd

vsim ShifRegisterTestBench
add wave sim:/ShiftRegisterTestBench/UUT/*

run 350 ns