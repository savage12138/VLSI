* SPICE NETLIST
***************************************

.SUBCKT M2_M1_via
** N=1 EP=0 IP=0 FDC=0
.ENDS
***************************************
.SUBCKT oai22_1x A gnd! B D F C vdd!
** N=12 EP=7 IP=3 FDC=8
M0 gnd! A 1 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.44e-14 AS=1.125e-14 PD=5e-07 PS=4.3e-07 $X=850 $Y=305 $D=1
M1 1 B gnd! gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.44e-14 AS=1.44e-14 PD=5e-07 PS=5e-07 $X=1270 $Y=305 $D=1
M2 F D 1 gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.89e-14 AS=1.44e-14 PD=6e-07 PS=5e-07 $X=1690 $Y=305 $D=1
M3 1 C F gnd! NMOS_VTL L=5e-08 W=9e-08 AD=1.125e-14 AS=1.89e-14 PD=4.3e-07 PS=6e-07 $X=2210 $Y=305 $D=1
M4 11 A vdd! vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.44e-14 AS=1.125e-14 PD=5e-07 PS=4.3e-07 $X=850 $Y=1465 $D=0
M5 F B 11 vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.44e-14 AS=1.44e-14 PD=5e-07 PS=5e-07 $X=1270 $Y=1465 $D=0
M6 12 D F vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.89e-14 AS=1.44e-14 PD=6e-07 PS=5e-07 $X=1690 $Y=1465 $D=0
M7 vdd! C 12 vdd! PMOS_VTL L=5e-08 W=9e-08 AD=1.125e-14 AS=1.89e-14 PD=4.3e-07 PS=6e-07 $X=2210 $Y=1465 $D=0
.ENDS
***************************************
