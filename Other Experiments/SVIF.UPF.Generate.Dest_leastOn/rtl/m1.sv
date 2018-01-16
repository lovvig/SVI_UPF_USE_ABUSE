module m1 #(parameter BIT_WIDTH = 2)(
	   input logic          ck,
           input logic          arst,
           in_TimingEngine      uin_TimingEngineS1);

	genvar ii;
		generate
		for (ii = 0; ii<BIT_WIDTH; ii++) 
		begin : la_m1
			always_ff @(posedge ck or posedge arst) 
			begin
                		if (arst)
		                begin
        		                uin_TimingEngineS1.radioEnableSynced[ii] <= 'h0;
                        		uin_TimingEngineS1.radioRxEnSynced[ii]   <= 'h0;
                		end
                		else
                		begin
                        		uin_TimingEngineS1.radioEnableSynced[ii] <= uin_TimingEngineS1.pllSettled[ii];
                    		    	uin_TimingEngineS1.radioRxEnSynced[ii]   <= uin_TimingEngineS1.tArstFs[ii];
                		end
        		end
		end : la_m1
	endgenerate
        
endmodule

