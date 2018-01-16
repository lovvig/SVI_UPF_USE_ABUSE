module m2 #(parameter BIT_WIDTH = 2)(
	   input logic          ck,
           input logic          arst,
	   input logic		isolateM1M2,
           in_TimingEngine      uin_TimingEngineS2,
           in_TimingEngine      uin_TimingEngineS3);

	genvar ii;
		generate
		for (ii = 0; ii<BIT_WIDTH; ii++) 
		begin : la_m2
			always_ff @(posedge ck or posedge arst)
        		begin
                		if (arst)
               			begin
                        		uin_TimingEngineS3.radioEnable1[ii]  <= 'h0;
                        		uin_TimingEngineS3.radioRxEn1[ii]    <= 'h0;
                		end
                		else
                		begin
                        		uin_TimingEngineS3.radioEnable1[ii]  <= uin_TimingEngineS2.radioEnableSynced[ii];
                        		uin_TimingEngineS3.radioRxEn1[ii]    <= uin_TimingEngineS2.radioRxEnSynced[ii];
                		end
        		end
		end : la_m2
	endgenerate

endmodule

