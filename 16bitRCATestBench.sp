***********************************Hspice Simulation Testdeck *********************************
.TITLE 16bitRCA Hspice simulation deck
*******************************************************************************************
*include transistor models forNMOS and PMOS
.include "/tools/cadence/FreePDK4514/ncsu_basekit/models/hspice/tran_models/models_nom/PMOS_VTL.inc"
.include "/tools/cadence/FreePDK4514/ncsu_basekit/models/hspice/tran_models/models_nom/NMOS_VTL.inc"

****************************** Declare Global signals **************************************
.global VDD GND

************************************SPICE Options*******************************************
*Various options are available
.TEMP 25                    $The temperature is set to nominalvalue of 25
.option  ACCURATE   =1      $Selects a time algorithm for circuits to get accurate measurements
.option  RUNLVL     =5
.option  MEASDGT    =6      $Formats the decimal digits to numbers in scientific notation
.option  MEASOUT
.OPTIONS GMINDC     =1e-18  $Specifies the paralled conductance for each node of MOSFET
.option  probe post =2      $Output in ASCII format
*.option MEASFORM   =3      $This formats the output variables into seperate columns
.OPTION INGOLD=1            $output values as scientific notation
*******************************************************************************************

************************************GlobalParameters*****************************************
.param VDD       = 0.9            $Parameter to set the supply voltage
.param GND       = 0              $Parameter to set ground voltage

**************************Input Signal Pulse settings***************************************
.param tr_clk        = 30p        $Parameter to indicate the rise time of the Input Signal
.param tf_clk        = 30p        $Parameter to indicate the fall time of the Input Signal
.param period_clk    = 200p       $Parameter to indicate the period of the Input Signal
**.param pw_clk        = '(period_clk/2)-(tr_clk+tf_clk/2)' $Parameter calculating the pulse width of the Input Signal

*****************************DUT (SUBCKT)Definition/file inclusion*****************************
.include "/nethome/ywang3325/ece3150/16bitRCA.pex.netlist"


**************************************DUT Instantiation *************************************
X16bitRCA GND SUM<15> SUM<7> A<8> VDD A<0> B<0> B<8> COUT CIN B<7> B<15>
+ A<7> A<15> SUM<0> SUM<8> SUM<6> SUM<14> A<9> A<1> B<1> B<9> B<6> B<14> A<6>
+ A<14> SUM<1> SUM<9> SUM<5> SUM<13> A<10> A<2> B<10> B<2> B<13> B<5> A<5> A<13>
+ SUM<2> SUM<10> SUM<4> SUM<12> A<11> A<3> B<3> B<11> B<12> B<4> A<4> A<12>
+ SUM<3> SUM<11> 16bitRCA

*********************************Connect Voltage sources *************************************
Vvdd VDD 0 DC = VDD
Vgnd GND 0 DC = GND
**Truth Table
VpwlA A 0 PWL (0 0 370p 0 400p VDD 770p VDD 800p 0 870p 0)
VpwlB B 0 PWL (0 0 170p 0 200p VDD 370p VDD 400p 0 570p 0 600p VDD 770p VDD 800p 0 870p 0)
VpwlC C 0 PWL (0 0 70p 0 100p VDD 170p VDD 200p 0 270p 0 300p VDD 370p VDD 400p 0 470p 0 500p VDD 570p VDD 600p 0 670p 0 700p VDD 770p VDD 800p 0 870p 0)
**Measure the delay for output going from 1 to 0
*VpwlA A 0 PWL (200p 0 370p 0 400p VDD)
*VpwlB B 0 PWL (200p VDD 370p VDD 400p 0)
*VpwlC C 0 PWL (200p 0 270p 0 300p VDD 370p VDD 400 0)
**Measure the delay for output going from 0 to 1
*VpwlA A 0 PWL (700p VDD 770p VDD 800p 0 870p 0)
*VpwlB B 0 PWL (700p VDD 770p VDD 800p 0 870p 0)
*VpwlC C 0 PWL (700p VDD 770p VDD 800p 0 870p 0)

**************************************Delay switch from 1 to 0*********************************

**Measure the delay from 000 to 011
*VpwlA A 0 PWL (0 0 200p 0)
*VpwlB B 0 PWL (0 0 170p 0 200p VDD 370p VDD 400p 0)
*VpwlC C 0 PWL (0 0 170p 0 200p VDD 570p VDD 600p 0)
**Measure the delay from 000 to 100
*VpwlA A 0 PWL (0 0 70p 0 100p VDD 170p VDD 200p 0)
*VpwlB B 0 PWL (0 0 200p 0)
*VpwlC C 0 PWL (0 0 200p 0)
**Measure the delay from 000 to 101
*VpwlA A 0 PWL (0 0 70p 0 100p VDD 170p VDD 200p 0)
*VpwlB B 0 PWL (0 0 200p 0)
*VpwlC C 0 PWL (0 0 70p 0 100p VDD 470p VDD 500p 0)
**Measure the delay from 000 to 110
*VpwlA A 0 PWL (0 0 70p 0 100p VDD 170p VDD 200p 0)
*VpwlB B 0 PWL (0 0 70p 0 100p VDD 270p VDD 300p 0)
*VpwlC C 0 PWL (0 0 200p 0)
**Measure the delay from 000 to 111 
*VpwlA A 0 PWL (0 0 70p 0 100p VDD 170p VDD 200p 0)
*VpwlB B 0 PWL (0 0 70p 0 100p VDD 270p VDD 300p 0)
*VpwlC C 0 PWL (0 0 70p 0 100p VDD 470p VDD 500p 0)
**Measure the delay from 001 to 011 (Worst Delay) (21)
*VpwlA A 0 PWL (0 0 200p 0)
*VpwlB B 0 PWL (0 0 170p 0 200p VDD 370p VDD 400p 0)
*VpwlC C 0 PWL (0 VDD 200p VDD 570p VDD 600p 0)
**Measure the delay from 001 to 100
*VpwlA A 0 PWL (0 0 70p 0 100p VDD 170p VDD 200p 0)
*VpwlB B 0 PWL (0 0 200p 0)
*VpwlC C 0 PWL (0 VDD 70p VDD 100p 0 470p 0)
**Measure the delay from 001 to 101
*VpwlA A 0 PWL (0 0 70p 0 100p VDD 170p VDD 200p 0)
*VpwlB B 0 PWL (0 0 200p 0)
*VpwlC C 0 PWL (0 VDD 200p VDD)
**Measure the delay from 001 to 110
*VpwlA A 0 PWL (0 0 70p 0 100p VDD 170p VDD 200p 0)
*VpwlB B 0 PWL (0 0 70p 0 100p VDD 270p VDD 300p 0)
*VpwlC C 0 PWL (0 VDD 70p VDD 100p 0 470p 0)
**Measure the delay from 001 to 111
*VpwlA A 0 PWL (0 0 70p 0 100p VDD 170p VDD 200p 0)
*VpwlB B 0 PWL (0 0 70p 0 100p VDD 270p VDD 300p 0)
*VpwlC C 0 PWL (0 VDD 200p VDD)
**Measure the delay from 010 to 011
*VpwlA A 0 PWL (0 0 800p 0)
*VpwlB B 0 PWL (0 VDD 800p VDD)
*VpwlC C 0 PWL (0 0 370p 0 400p VDD 770p VDD 800p 0)
**Measure the delay from 010 to 100
*VpwlA A 0 PWL (0 0 70p 0 100p VDD 170p VDD 200p 0)
*VpwlB B 0 PWL (0 VDD 70p VDD 100p 0 270p 0 300p VDD)
*VpwlC C 0 PWL (0 0 200p 0)
**Measure the delay from 010 to 101
*VpwlA A 0 PWL (0 0 70p 0 100p VDD 170p VDD 200p 0)
*VpwlB B 0 PWL (0 VDD 70p VDD 100p 0 270p 0 300p VDD)
*VpwlC C 0 PWL (0 0 70p 0 100p VDD 470p VDD 500p 0)
**Measure the delay from 010 to 110
*VpwlA A 0 PWL (0 0 70p 0 100p VDD 170p VDD 200p 0)
*VpwlB B 0 PWL (0 VDD 200p VDD)
*VpwlC C 0 PWL (0 0 200p 0)
**Measure the delay from 010 to 111 (Best Delay) (6.67) 
*VpwlA A 0 PWL (0 0 70p 0 100p VDD 170p VDD 200p 0)
*VpwlB B 0 PWL (0 VDD 200p VDD)
*VpwlC C 0 PWL (0 0 70p 0 100p VDD 470p VDD 500p 0)

**************************************Delay switch from 0 to 1*********************************

**Measure the delay from 011 to 000
*VpwlA A 0 PWL (0 0 200p 0)
*VpwlB B 0 PWL (0 VDD 170p VDD 200p 0 370p 0 400p VDD)
*VpwlC C 0 PWL (0 VDD 170p VDD 200p 0 570p 0 600p VDD)
**Measure the delay from 100 to 000 
*VpwlA A 0 PWL (0 VDD 70p VDD 100p 0 170p 0 200p VDD)
*VpwlB B 0 PWL (0 0 200p 0)
*VpwlC C 0 PWL (0 0 200p 0)
**Measure the delay from 101 to 000
*VpwlA A 0 PWL (0 VDD 70p VDD 100p 0 170p 0 200p VDD)
*VpwlB B 0 PWL (0 0 200p 0)
*VpwlC C 0 PWL (0 VDD 70p VDD 100p 0 470p 0 500p VDD)
**Measure the delay from 110 to 000
*VpwlA A 0 PWL (0 VDD 70p VDD 100p 0 170p 0 200p VDD)
*VpwlB B 0 PWL (0 VDD 70p VDD 100p 0 270p 0 300p VDD)
*VpwlC C 0 PWL (0 0 200p 0)
**Measure the delay from 111 to 000
*VpwlA A 0 PWL (0 VDD 70p VDD 100p 0 170p 0 200p VDD)
*VpwlB B 0 PWL (0 VDD 70p VDD 100p 0 270p 0 300p VDD)
*VpwlC C 0 PWL (0 VDD 70p VDD 100p 0 470p 0 500p VDD)
**Measure the delay from 011 to 001
*VpwlA A 0 PWL (0 0 200p 0)
*VpwlB B 0 PWL (0 VDD 170p VDD 200p 0 370p 0 400p VDD)
*VpwlC C 0 PWL (0 VDD 400p VDD)
**Measure the delay from 100 to 001
*VpwlA A 0 PWL (0 VDD 70p VDD 100p 0 170p 0 200p VDD)
*VpwlB B 0 PWL (0 0 200p 0)
*VpwlC C 0 PWL (0 0 70p 0 100p VDD 470p VDD 500p 0)
**Measure the delay from 101 to 001
*VpwlA A 0 PWL (0 VDD 70p VDD 100p 0 170p 0 200p VDD)
*VpwlB B 0 PWL (0 0 200p 0)
*VpwlC C 0 PWL (0 VDD 200p VDD)
**Measure the delay from 110 to 001
*VpwlA A 0 PWL (0 VDD 70p VDD 100p 0 170p 0 200p VDD)
*VpwlB B 0 PWL (0 VDD 70p VDD 100p 0 270p 0 300p VDD)
*VpwlC C 0 PWL (0 0 70p 0 100p VDD 470p VDD 500p 0)
**Measure the delay from 111 to 001
*VpwlA A 0 PWL (0 VDD 70p VDD 100p 0 170p 0 200p VDD)
*VpwlB B 0 PWL (0 VDD 70p VDD 100p 0 270p 0 300p VDD)
*VpwlC C 0 PWL (0 VDD 200p VDD)
**Measure the delay from 011 to 010
*VpwlA A 0 PWL (0 0 200p 0)
*VpwlB B 0 PWL (0 VDD 400p VDD)
*VpwlC C 0 PWL (0 VDD 370p VDD 400p 0 770p 0 800p VDD)
**Measure the delay from 100 to 010
*VpwlA A 0 PWL (0 VDD 70p VDD 100p 0 170p 0 200p VDD)
*VpwlB B 0 PWL (0 0 70p 0 100p VDD 270p VDD 300p 0)
*VpwlC C 0 PWL (0 0 200p 0)
**Measure the delay from 101 to 010
*VpwlA A 0 PWL (0 VDD 70p VDD 100p 0 170p 0 200p VDD)
*VpwlB B 0 PWL (0 0 70p 0 100p VDD 270p VDD 300p 0)
*VpwlC C 0 PWL (0 VDD 70p VDD 100p 0 470p 0 500p VDD)
**Measure the delay from 110 to 010
*VpwlA A 0 PWL (0 VDD 70p VDD 100p 0 170p 0 200p VDD)
*VpwlB B 0 PWL (0 VDD 200p VDD)
*VpwlC C 0 PWL (0 0 200p 0)
**Measure the delay from 111 to 010
*VpwlA A 0 PWL (0 VDD 70p VDD 100p 0 170p 0 200p VDD)
*VpwlB B 0 PWL (0 VDD 200p VDD)
*VpwlC C 0 PWL (0 VDD 70p VDD 100p 0 470p 0 500p VDD)

****************************************Start Transient Analysis**************************
**Time interval for entire truth table
.tran 1p 870p Start = 0.0
**Time interval for measure output delay going from 1 to 0
*.tran 1p 400p Start = 200p
**Time interval for measure output delay going from 0 to 1
*.tran 1p 870p Start = 700p

**Set time from 0 to 200p
**Used for 000 to 100, 000 to 101, 000 to 110, 000 to 111
**001 to 100, 001 to 101, 001 to 110, 001 to 111
**010 to 100, 010 to 101, 010 to 110, 010 to 111
**100 to 000, 101 to 000, 110 to 000, 111 to 000
**100 to 001, 101 to 001, 110 to 001, 111 to 001
**100 to 010, 101 to 010, 110 to 010, 111 to 010
*.tran 1p 200p Start = 0.0
**Set time from 0 to 400p
**Used for 001 to 011, 011 to 000, 011 to 001,
*.tran 1p 400p Start = 0.0
**Set time from 0 to 800p
**Used for 010 to 011, 011 to 010,
*.tran 1p 800p Start = 0.0
**Set time from 0 to 630p
**Used for 000 to 011, 
*.tran 1p 630p Start = 0.0
****************************************Measure statements **************************
**Measure the delay for output going from 1 to 0 (15.9)
*.meas tran ouputFalldelay TRIG V(C) VAL ='VDD/2' RISE = 1 TARG V(F) VAL='VDD/2' FALL = 0
**Measure the delay for output going from 0 to 1 (13.4)
*.meas tran outputRisedelay1 TRIG V(A) VAL ='VDD/2' FALL = 0 TARG V(F) VAL='VDD/2' RISE = 0
*.meas tran outputRisedelay2 TRIG V(B) VAL ='VDD/2' FALL = 0 TARG V(F) VAL='VDD/2' RISE = 0
*.meas tran outputRisedelay3 TRIG V(C) VAL ='VDD/2' FALL = 0 TARG V(F) VAL='VDD/2' RISE = 0

****************************************Measure Delay 1 to 0**************************

**Measure delay from 000 to 011 (18.2)
*.meas tran Delay1 TRIG V(B) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0
*.meas tran Delay2 TRIG V(C) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0
**Measure delay from 000 to 100 (12)
*.meas tran delay TRIG V(A) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
**Measure delay from 000 to 101 (10.7)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
*.meas tran delay2 TRIG V(C) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
**Measure delay from 000 to 110 (12.2)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
*.meas tran delay2 TRIG V(B) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
**Measure delay from 000 to 111 (7.94)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0
*.meas tran delay2 TRIG V(B) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0
*.meas tran delay3 TRIG V(C) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0
**Measure delay from 001 to 011 (21) (Worst Delay)
*.meas tran worstDelay TRIG V(B) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0
**Measure delay from 001 to 100 (11.7)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
**Measure delay from 001 to 101 (12.4) 
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
**Measure delay from 001 to 110 (11.8)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
*.meas tran delay2 TRIG V(B) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
**Measure delay from 001 to 111 (8.27)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
*.meas tran delay2 TRIG V(B) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
**Measure delay from 010 to 011 (15.9)
*.meas tran delay TRIG V(C) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
**Measure delay from 010 to 100 (11.9)
*.meas tran delay TRIG V(A) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
**Measure delay from 010 to 101 (8.31)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
*.meas tran delay2 TRIG V(C) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
**Measure delay from 010 to 110 (12.1)
*.meas tran delay TRIG V(A) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
**Measure delay from 010 to 111 (6.67) (Best Delay)
*.meas tran bestDelay1 TRIG V(A) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 
*.meas tran bestDelay2 TRIG V(C) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' FALL = 0 

****************************************Measure Delay 0 to 1**************************

**Measure delay from 011 to 000 (12.2)
*.meas tran delay1 TRIG V(B) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
*.meas tran delay2 TRIG V(C) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
**Measure delay from 100 to 000 (11.2)
*.meas tran delay TRIG V(A) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
**Measure delay from 101 to 000 (12.9)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
*.meas tran delay2 TRIG V(C) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
**Measure delay from 110 to 000 (11.8)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
*.meas tran delay2 TRIG V(B) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
**Measure delay from 111 to 000 (13.7)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
*.meas tran delay2 TRIG V(B) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
*.meas tran delay3 TRIG V(C) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
**Measure delay from 011 to 001（17.6）
*.meas tran delay TRIG V(B) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
**Measure delay from 100 to 001 (13.9)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
*.meas tran delay2 TRIG V(C) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
**Measure delay from 101 to 001 (16.2)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
**Measure delay from 110 to 001 (16.1)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
*.meas tran delay2 TRIG V(B) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
*.meas tran delay3 TRIG V(C) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
**Measure delay from 111 to 001 (18.6)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
*.meas tran delay2 TRIG V(B) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0
**Measure delay from 011 to 010 (16.5)
*.meas tran delay TRIG V(C) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
**Measure delay from 100 to 010 (11.8)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
*.meas tran delay2 TRIG V(B) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' RISE = 0
**Measure delay from 101 to 010 (13.7)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
*.meas tran delay2 TRIG V(B) VAL = 'VDD/2' RISE = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
*.meas tran delay3 TRIG V(C) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
**Measure delay from 110 to 010 (12.3)
*.meas tran delay TRIG V(A) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
**Measure delay from 111 to 010 (15)
*.meas tran delay1 TRIG V(A) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0 
*.meas tran delay2 TRIG V(C) VAL = 'VDD/2' FALL = 0 TARG V(F) VAL = 'VDD/2' RISE = 0
*****************************************Probe signals***************************************
.option captab
.probe v(*)
.probe i(*)

*******************************************************************************************
.option lis_new=1
.option probe post

*******************************************************************************************
.end
********************************* END OF SPICE DECK ***********************************
