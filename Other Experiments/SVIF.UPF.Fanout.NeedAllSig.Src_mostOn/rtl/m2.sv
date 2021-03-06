module m2 (input logic          ck,
           input logic          arst,
  	   input logic		isolateM1M2,
           in_TimingEngine      uin_TimingEngineS2,
	   in_TimingEngine	uin_TimingEngineS3);

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_TimingEngineS3.radioEnable1  <= 'h0;
                        uin_TimingEngineS3.radioRxEn1    <= 'h0;
                end
                else
                begin
                        uin_TimingEngineS3.radioEnable1  <= uin_TimingEngineS2.radioEnableSynced;
                        uin_TimingEngineS3.radioRxEn1    <= uin_TimingEngineS2.radioRxEnSynced;
                end
        end

endmodule
