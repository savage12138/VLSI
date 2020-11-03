* SPICE NETLIST
***************************************

.SUBCKT M2_M1_via
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT aoi21_1x F A B C vss! vdd!
** N=10 EP=6 IP=4 FDC=6
M0 vss! A F vss! NMOS_VTL L=5e-08 W=9e-08 AD=2.16e-14 AS=1.35e-14 PD=6.8e-07 PS=4.8e-07 $X=520 $Y=420 $D=1
M1 10 B vss! vss! NMOS_VTL L=5e-08 W=1.8e-07 AD=2.88e-14 AS=2.16e-14 PD=6.8e-07 PS=6.8e-07 $X=940 $Y=240 $D=1
M2 F C 10 vss! NMOS_VTL L=5e-08 W=1.8e-07 AD=2.7e-14 AS=2.88e-14 PD=6.6e-07 PS=6.8e-07 $X=1360 $Y=240 $D=1
M3 3 A F vdd! PMOS_VTL L=5e-08 W=3.6e-07 AD=5.76e-14 AS=5.4e-14 PD=1.04e-06 PS=1.02e-06 $X=520 $Y=1920 $D=0
M4 vdd! B 3 vdd! PMOS_VTL L=5e-08 W=3.6e-07 AD=5.76e-14 AS=5.76e-14 PD=1.04e-06 PS=1.04e-06 $X=940 $Y=1920 $D=0
M5 3 C vdd! vdd! PMOS_VTL L=5e-08 W=3.6e-07 AD=5.4e-14 AS=5.76e-14 PD=1.02e-06 PS=1.04e-06 $X=1360 $Y=1920 $D=0
.ENDS
***************************************
