// Automatically generated by spice2al
// Version 1.14
// Date: Mon Nov 12 18:30:20 2007
// Input: cells.sp

{
    auto nl;

    nl = makeNetlist( "NAND3X1" );

    nl->declarePowerNets( "vdd", "gnd" );

    nl->addPMosfet( "M0", 0.5, 0.05, "vdd", "A", "Y", "vdd", "pmos" );
    nl->addPMosfet( "M1", 0.5, 0.05, "Y", "B", "vdd", "vdd", "pmos" );
    nl->addPMosfet( "M2", 0.5, 0.05, "vdd", "C", "Y", "vdd", "pmos" );
    nl->addNMosfet( "M3", 0.75, 0.05, "gnd", "A", "a_9_6", "gnd", "nmos" );
    nl->addNMosfet( "M4", 0.75, 0.05, "a_9_6", "B", "a_14_6", "gnd", "nmos" );
    nl->addNMosfet( "M5", 0.75, 0.05, "a_14_6", "C", "Y", "gnd", "nmos" );

    nl->addPort( "B" );
    nl->addPort( "vdd" );
    nl->addPort( "gnd" );
    nl->addPort( "A" );
    nl->addPort( "C" );
    nl->addPort( "Y" );

    nl;
}
