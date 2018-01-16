module m2 (input logic 		ck,
	   input logic		arst,
	   input logic		isolateM1M2,
	   in_TimingEngine	uin_TimingEngineS2);

	always_ff @(posedge ck or posedge arst)
	begin
		if (arst)
		begin
			uin_TimingEngineS2.radioEnable 	<= 'h0;
			uin_TimingEngineS2.radioRxEn 	<= 'h0;
		end
		else
		begin
			uin_TimingEngineS2.radioEnable	<= uin_TimingEngineS2.radioEnableSynced;
			uin_TimingEngineS2.radioRxEn	<= uin_TimingEngineS2.radioRxEnSynced;
		end
	end

endmodule

