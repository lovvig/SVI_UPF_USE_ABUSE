module m1 #(parameter BIT_WIDTH = 2)(
	   input logic          ck,
           input logic          arst,
           in_TimingEngine      uin_TimingEngineS1[BIT_WIDTH-1:0]);

	genvar ii;
		generate
		for (ii = 0; ii<BIT_WIDTH; ii++) 
		begin : la_m1
			always_ff @(posedge ck or posedge arst) 
			begin
                		if (arst)
		                begin
        		                uin_TimingEngineS1[ii].radioEnableSynced <= 'h0;
                        		uin_TimingEngineS1[ii].radioRxEnSynced   <= 'h0;
                		end
                		else
                		begin
                        		uin_TimingEngineS1[ii].radioEnableSynced <= uin_TimingEngineS1[ii].pllSettled;
                    		    	uin_TimingEngineS1[ii].radioRxEnSynced   <= uin_TimingEngineS1[ii].tArstFs;
                		end
        		end
		end : la_m1
	endgenerate
        
	/*always_ff @(posedge ck or posedge arst) 
	begin
        	if (arst)
		begin
        		uin_TimingEngineS1[0].radioEnableSynced <= 'h0;
                        uin_TimingEngineS1[0].radioRxEnSynced   <= 'h0;
        		uin_TimingEngineS1[1].radioEnableSynced <= 'h0;
                        uin_TimingEngineS1[1].radioRxEnSynced   <= 'h0;
               	end
                else
                begin
                    	uin_TimingEngineS1[0].radioEnableSynced <= uin_TimingEngineS1[0].pllSettled;
                    	uin_TimingEngineS1[0].radioRxEnSynced   <= uin_TimingEngineS1[0].tArstFs;
                    	uin_TimingEngineS1[1].radioEnableSynced <= uin_TimingEngineS1[1].pllSettled;
                    	uin_TimingEngineS1[1].radioRxEnSynced   <= uin_TimingEngineS1[1].tArstFs;
                end
        end*/
endmodule

