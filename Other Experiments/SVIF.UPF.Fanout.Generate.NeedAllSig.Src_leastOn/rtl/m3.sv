module m3 #(parameter BIT_WIDTH = 2)(
	   input logic          ck,
           input logic          arst,
	   input logic		isolateM1M3,
           in_TimingEngine      uin_TimingEngineS2,
           in_TimingEngine      uin_TimingEngineS4);

	genvar ii;
		generate
		for (ii = 0; ii<BIT_WIDTH; ii++) 
		begin : la_m3
			always_ff @(posedge ck or posedge arst)
        		begin
                		if (arst)
               			begin
                        		uin_TimingEngineS4.radioEnable2[ii]  <= 'h0;
                        		uin_TimingEngineS4.radioRxEn2[ii]    <= 'h0;
                		end
                		else
                		begin
                        		uin_TimingEngineS4.radioEnable2[ii]  <= uin_TimingEngineS2.radioEnableSynced[ii];
                        		uin_TimingEngineS4.radioRxEn2[ii]    <= uin_TimingEngineS2.radioRxEnSynced[ii];
                		end
        		end
		end : la_m3
	endgenerate

endmodule

