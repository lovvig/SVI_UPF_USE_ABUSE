module m2 (input logic          ck,
           input logic          arst,
	   input logic		isolateM1,
           in_TimingEngine      uin_TimingEngineS4,
           in_TimingEngine      uin_TimingEngineS5);
	
	/* Module instantiation */
	m5 u_m5 (.ck            	(ck),
                 .arst          	(arst),
                 .uin_TimingEngineS5    (uin_TimingEngineS5));

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_TimingEngineS4.radioEnable1 <= 'h0;
                        uin_TimingEngineS4.radioRxEn1   <= 'h0;
                end
                else
                begin
                        uin_TimingEngineS4.radioEnable1 <= uin_TimingEngineS4.radioEnableUnsynced;
                        uin_TimingEngineS4.radioRxEn1   <= uin_TimingEngineS4.radioRxEnUnsynced;
                end
        end

endmodule

