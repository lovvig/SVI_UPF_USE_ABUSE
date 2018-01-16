//====================================================================  
//        Copyright (c) 2017 Nordic Semiconductor ASA, Norway           
//====================================================================  
// Description   : 
// 		  
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

        output logic	[BIT_WIDTH-1:0]	out1,
        output logic	[BIT_WIDTH-1:0]	out2
        );

        /* Interface instantiation */
        in_TimingEngine #(.BIT_WIDTH(BIT_WIDTH)) uin_TimingEngine ();

	genvar ii;
	generate
		for (ii = 0; ii<BIT_WIDTH; ii++) 
		begin : la_top
        		/* Assign inputs  */
        		assign uin_TimingEngine.pllSettled[ii]   = in1[ii];
        		assign uin_TimingEngine.tArstFs[ii] = in2[ii];
			/* Assign outputs */
			assign out1[ii] = uin_TimingEngine.radioEnable[ii];
		        assign out2[ii] = uin_TimingEngine.radioRxEn[ii];
		end : la_top
	endgenerate

        /* Module instantiation */
        m1 u_m1 (.ck                    (ck),
                 .arst                  (arst),
                 .uin_TimingEngineS1    (uin_TimingEngine.Stage1));
        m2 u_m2 (.ck            	(ck),
                 .arst          	(arst),
		 .isolateM1		(isolateM1),
                 .uin_TimingEngineS2    (uin_TimingEngine.Stage2));
	/*m3 u_m3 (.ck            	(ck),
                 .arst          	(arst),
                 .uin_TimingEngineS3    (uin_TimingEngine.Stage3));*/

endmodule
