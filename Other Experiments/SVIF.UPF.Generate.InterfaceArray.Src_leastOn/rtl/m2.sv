module m2 #(parameter BIT_WIDTH = 2)(
	   input logic          ck,
           input logic          arst,
	   input logic		isolateM1,
           in_TimingEngine      uin_TimingEngineS2[BIT_WIDTH-1:0]);

	genvar ii;
		generate
		for (ii = 0; ii<BIT_WIDTH; ii++) 
		begin : la_m2
			always_ff @(posedge ck or posedge arst)
        		begin
                		if (arst)
               			begin
                        		uin_TimingEngineS2[ii].radioEnable  <= 'h0;
                        		uin_TimingEngineS2[ii].radioRxEn    <= 'h0;
                		end
                		else
                		begin
                        		uin_TimingEngineS2[ii].radioEnable  <= uin_TimingEngineS2[ii].radioEnableSynced;
                        		uin_TimingEngineS2[ii].radioRxEn    <= uin_TimingEngineS2[ii].radioRxEnSynced;
                		end
        		end
		end : la_m2
	endgenerate

endmodule

