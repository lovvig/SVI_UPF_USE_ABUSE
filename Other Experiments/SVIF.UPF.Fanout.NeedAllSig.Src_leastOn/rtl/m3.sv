module m3 (input logic          ck,
           input logic          arst,
  	   input logic		isolateM1M3,
           in_TimingEngine      uin_TimingEngineS2,
	   in_TimingEngine	uin_TimingEngineS4);

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_TimingEngineS4.radioRxEn2    <= 'h0;
                        uin_TimingEngineS4.radioEnable2  <= 'h0;
                end
                else
                begin
                        uin_TimingEngineS4.radioRxEn2    <= uin_TimingEngineS2.radioRxEnSynced;
                        uin_TimingEngineS4.radioEnable2  <= uin_TimingEngineS2.radioEnableSynced;
                end
        end

endmodule
