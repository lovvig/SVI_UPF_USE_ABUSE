//====================================================================  
//        Copyright (c) 2017 Nordic Semiconductor ASA, Norway           
//====================================================================  
// Description   : Signals in an SVI is propagating from m1 to m2
// 		   and 3 via the same modport. Assignments in
// 		   generate statements.
// 		   PD_M1 is less on than PD_M2 and PD_M3 
//====================================================================  

module top #(
	parameter BIT_WIDTH = 2)(
        input  logic			ck,
        input  logic			arst,
        input  logic	[BIT_WIDTH-1:0]	in1,
        input  logic	[BIT_WIDTH-1:0]	in2,
        input  logic			isolateM1,
        input  logic			isolateM2,
        input  logic			isolateM3,

        output logic	[BIT_WIDTH-1:0]	out1_1,
        output logic	[BIT_WIDTH-1:0]	out1_2,
        output logic	[BIT_WIDTH-1:0]	out2_1,
        output logic	[BIT_WIDTH-1:0]	out2_2
        );

        /* Interface instantiation */
        in_TimingEngine #(.BIT_WIDTH(BIT_WIDTH)) uin_TimingEngine ();

	genvar ii;
	generate
		for (ii = 0; ii<BIT_WIDTH; ii++) 
		begin : la_top
        		/* Assign inputs  */
        		assign uin_TimingEngine.pllSettled[ii] = in1[ii];
        		assign uin_TimingEngine.tArstFs[ii]    = in2[ii];
			/* Assign outputs */
			assign out1_1[ii] = uin_TimingEngine.radioEnable1[ii];
			assign out1_2[ii] = uin_TimingEngine.radioEnable2[ii];
		        assign out2_1[ii] = uin_TimingEngine.radioRxEn1[ii];
		        assign out2_2[ii] = uin_TimingEngine.radioRxEn2[ii];
		end : la_top
	endgenerate

        /* Module instantiation */
        m1 u_m1 (.ck                    (ck),
                 .arst                  (arst),
                 .uin_TimingEngineS1    (uin_TimingEngine.Stage1));
        m2 u_m2 (.ck            	(ck),
                 .arst          	(arst),
		 .isolateM1M2		(isolateM1),
                 .uin_TimingEngineS2    (uin_TimingEngine.Stage2),
                 .uin_TimingEngineS3    (uin_TimingEngine.Stage3));
	m3 u_m3 (.ck            	(ck),
                 .arst          	(arst),
		 .isolateM1M3		(isolateM1),
                 .uin_TimingEngineS2    (uin_TimingEngine.Stage2),
                 .uin_TimingEngineS4    (uin_TimingEngine.Stage4));
endmodule
