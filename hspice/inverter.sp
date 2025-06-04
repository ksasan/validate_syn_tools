* CMOS Inverter Test Circuit

VDD  vdd  0   1.8
VIN  in   0   PULSE(0 1.8 0 1n 1n 5n 10n)
M1    out in  vdd vdd  PMOS  L=0.18u W=1.8u
M2    out in  0   0    NMOS  L=0.18u W=0.9u
Cload out 0   10f

.model NMOS NMOS (LEVEL=1 VTO=0.7 KP=120u)
.model PMOS PMOS (LEVEL=1 VTO=-0.7 KP=40u)

.tran 0.1n 50n
.options post
.end

