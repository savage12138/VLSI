***********************************Sample Hspice testdeck **********************************
.TITLE Inv_1x Hspice simulation deck
********************************************************************************************
*include transistor models forNMOS and PMOS
.include "/tools/cadence/FreePDK4514/ncsu_basekit/models/hspice/tran_models/models_nom/PMOS_VTL.inc"
.include "/tools/cadence/FreePDK4514/ncsu_basekit/models/hspice/tran_models/models_nom/NMOS_VTL.inc"

****************************** Declare Global signals **************************************
.global VDD vdd!
+ VSS vss!

************************************SPICE Options***********************************************
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
*************************************************************************************************

************************************GlobalParameters*******************************************
.param VDD       = 0.9            $Parameter to set the supply voltage
.param GND       = 0              $Parameter to set ground voltage

**************************Input Signal Pulse settings***************************************
.param tr_clk        = 30p        $Parameter to indicate the rise time of the Input Signal
.param tf_clk        = 30p        $Parameter to indicate the fall time of the Input Signal
.param period_clk    = 100p       $Parameter to indicate the period of the Input Signal
**.param pw_clk        = '(period_clk/2)-(tr_clk+tf_clk/2)' $Parameter calculating the pulse width of the Input Signal

*****************************DUT (SUBCKT)Definition/file inclusion*****************************
.include "/nethome/ywang3325/ece3150/inv_1x.pex.netlist"

**************************************DUT Instantiation ****************************************
Xinv_1x0 A VSS! VDD! Z inv_1x
.param lumpCap=4*1.09576e-16
CFO4 Z GND lumpCap
**Xinv_1x1 Z VSS! VDD! Z1 inv_1x
**Xinv_1x2 Z VSS! VDD! Z2 inv_1x
**Xinv_1x3 Z VSS! VDD! Z3 inv_1x
**Xinv_1x4 Z VSS! VDD! Z4 inv_1x
*********************************Connect Voltage sources ****************************************
Vvdd VDD! 0 DC = VDD
Vvss VSS! 0 DC = GND
Vpwl a 0 PWL (0 0 10p 0 40p VDD 100p VDD 130p 0 170p 0 200p VDD 250p VDD  )

****************************************Start Transient Analysis**************************
.tran 1p 200p Start = 0.0

****************************************Measure statements **************************
**.meas tran P2PVALFALL PP V(Z) FROM=0p TO=100p		$Measure FO4
**.meas tran P2PVALRISE PP V(Z) FROM=100p TO=180p	$Measure FO4
.meas tran P2PVALFALL PP V(Z) FROM=0p TO=75p
.meas tran P2PVALRISE PP V(Z) FROM=75p TO=150p
.meas tran delay TRIG V(a) VAL='VDD/2' RISE=0 TARG V(z) VAL='VDD/2' FALL=0
.MEASURE TRAN FALL_TIME TRIG V(Z) VAL='0.9*P2PVALFALL' FALL=0 TARG V(Z) VAL='0.1*P2PVALFALL' FALL=0 $MEASURE FALL TIME
.MEASURE TRAN RISE_TIME TRIG V(Z) VAL='0.1*P2PVALRISE' RISE=0 TARG V(Z) VAL='0.9*P2PVALRISE' RISE=0 $MEASURE RISE TIME 

*****************************************Probe signals********************************************
.option captab
.probe v(*)
.probe i(*)

**************************************************************************************************

.option lis_new=1
.option probe post

****************************************************************************************************
.end
********************************* END OF SPICE DECK ************************************************
