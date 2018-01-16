//====================================================================  
//        Copyright (c) 2017 Nordic Semiconductor ASA, Norway           
//====================================================================  
// Description   :                              
//====================================================================  

module top (
        input  logic    ck,
        input  logic    arst,
        input  logic    in1,
        input  logic    in2,
        input  logic    isolateM1,
        input  logic    isolateM2,
 	input  logic 	isolateM3,

        output logic    out1_1,
	output logic	out1_2,
        output logic    out2_1,
	output logic	out2_2
        );

        /* Interface instantiation */
        in_MyBus uin_MyBus ();


        /* Assign inputs */
        assign uin_MyBus.start   = in1;
        assign uin_MyBus.data    = in2;

        /* Assing outputs */
        assign out1_1 = uin_MyBus.execute1;
        assign out1_2 = uin_MyBus.execute2;
        assign out2_1 = uin_MyBus.dataTx1;
        assign out2_2 = uin_MyBus.dataTx2;

        /* Module instantiation */
        m1 u_m1 (.ck                    (ck),
                 .arst                  (arst),
                 .uin_MyBusS1    (uin_MyBus.Stage1));
        m2 u_m2 (.ck            	(ck),
                 .arst          	(arst),
		 .isolateM1M2		(isolateM1),
                 .uin_MyBusS2    (uin_MyBus.Stage2),
                 .uin_MyBusS3    (uin_MyBus.Stage3));
	m3 u_m3 (.ck            	(ck),
                 .arst          	(arst),
		 .isolateM1M3		(isolateM1),
                 .uin_MyBusS2    (uin_MyBus.Stage2),
                 .uin_MyBusS4    (uin_MyBus.Stage4));
	
endmodule