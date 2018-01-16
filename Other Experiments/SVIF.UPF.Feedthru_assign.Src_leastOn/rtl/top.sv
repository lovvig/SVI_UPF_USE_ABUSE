//====================================================================  
//        Copyright (c) 2017 Nordic Semiconductor ASA, Norway           
//====================================================================  
// Description   : Signals in an SVI is propagating from m1 to m2
// 		   through m3 via assign. 
// 		   PD_M1 < PD_M3 < PD_M2                               
//====================================================================  

module top (
        input  logic    ck,
        input  logic    arst,
        input  logic    in1,
        input  logic    in2,
        input  logic    isolateM1,
        input  logic    isolateM2,
	input  logic 	isolateM3,

        output logic    out1,
        output logic    out2
        );

        /* Interface instantiation */
        in_TimingEngine uin_TimingEngine ();


        /* Assign inputs */
        assign uin_TimingEngine.pllSettled = in1;
        assign uin_TimingEngine.tArstFs = in2;

        /* Assing outputs */
        assign out1 = uin_TimingEngine.radioEnable;
        assign out2 = uin_TimingEngine.radioRxEn;

        /* Module instantiation */
        m1 u_m1 (.ck                    (ck),
                 .arst                  (arst),
                 .uin_TimingEngineS1    (uin_TimingEngine.Stage1));
        m2 u_m2 (.ck            	(ck),
                 .arst          	(arst),
		 .isolateM1		(isolateM1),
                 .uin_TimingEngineS3    (uin_TimingEngine.Stage3));
	m3 u_m3 (.uin_TimingEngineS2	(uin_TimingEngine.Stage2));

endmodule
