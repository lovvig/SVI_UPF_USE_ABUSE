module m1 (input logic		ck,
	   input logic		arst,
	   in_TimingEngine 	uin_TimingEngineS1);
	
	always_ff @(posedge ck or posedge arst)
	begin
		if (arst)
		begin
			uin_TimingEngineS1.radioEnableSynced 	<= 'h0;
			uin_TimingEngineS1.radioRxEnSynced 	<= 'h0;
		end
		else
		begin
			uin_TimingEngineS1.radioEnableSynced	<= uin_TimingEngineS1.pllSettled;
			uin_TimingEngineS1.radioRxEnSynced   	<= uin_TimingEngineS1.tArstFs;
		end
	end

endmodule

