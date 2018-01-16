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

        output logic    out1,
	output logic	out2
        );

        /* Interface instantiation */
        in_MyBus uin_MyBus ();


        /* Assign inputs */
        assign uin_MyBus.start   = in1;
        assign uin_MyBus.data    = in2;

        /* Assing outputs */
        assign out1 = uin_MyBus.execute;
        assign out2 = uin_MyBus.dataTx;

        /* Module instantiation */
        m1 u_m1 (.ck                    (ck),
                 .arst                  (arst),
                 .uin_MyBusS1    (uin_MyBus.Stage1));
        m2 u_m2 (.ck            	(ck),
                 .arst          	(arst),
		 .isolateM1M2		(isolateM1),
                 .uin_MyBusS5    (uin_MyBus.Stage5),
                 .uin_MyBusS6    (uin_MyBus.Stage6));
	m3 u_m3 (.ck            	(ck),
                 .arst          	(arst),
		 .isolateM1M3		(isolateM1),
                 .uin_MyBusS5    (uin_MyBus.Stage5),
                 .uin_MyBusS7    (uin_MyBus.Stage7));
	
endmodule