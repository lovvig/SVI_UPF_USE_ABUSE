module m3 (input logic          ck,
           input logic          arst,
  	   input logic		isolateM1M3,
	   in_TimingEngine	uin_TimingEngineS5,
           in_TimingEngine      uin_TimingEngineS3);

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_TimingEngineS5.radioRxEn  <= 'h0;
                end
                else
                begin
                        uin_TimingEngineS5.radioRxEn  <= uin_TimingEngineS3.radioRxEnSynced;
                end
        end

endmodule
