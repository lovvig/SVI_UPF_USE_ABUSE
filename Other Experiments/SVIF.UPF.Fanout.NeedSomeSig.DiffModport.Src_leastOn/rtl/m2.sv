module m2 (input logic          ck,
           input logic          arst,
  	   input logic		isolateM1M2,
	   in_TimingEngine	uin_TimingEngineS4,
           in_TimingEngine      uin_TimingEngineS3);

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_TimingEngineS4.radioEnable  <= 'h0;
                end
                else
                begin
                        uin_TimingEngineS4.radioEnable  <= uin_TimingEngineS3.radioEnableSynced;
                end
        end

endmodule
