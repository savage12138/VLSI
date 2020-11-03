* SPICE NETLIST
***************************************

.SUBCKT inv_1x a vss! vdd! z
** N=6 EP=4 IP=0 FDC=2
M0 z a vss! vss! NMOS_VTL L=5e-08 W=9e-08 AD=1.0125e-14 AS=1.0125e-14 PD=4.05e-07 PS=4.05e-07 $X=825 $Y=305 $D=1
M1 z a vdd! vdd! PMOS_VTL L=5e-08 W=1.8e-07 AD=2.025e-14 AS=2.025e-14 PD=5.85e-07 PS=5.85e-07 $X=825 $Y=1155 $D=0
.ENDS
***************************************
