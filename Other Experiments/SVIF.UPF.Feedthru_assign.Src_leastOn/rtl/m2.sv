module m2 (input logic          ck,
           input logic          arst,
	   input logic		isolateM1,
           in_TimingEngine      uin_TimingEngineS3);

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_TimingEngineS3.radioEnable  <= 'h0;
                        uin_TimingEngineS3.radioRxEn    <= 'h0;
                end
                else
                begin
                        uin_TimingEngineS3.radioEnable  <= uin_TimingEngineS3.radioEnableUnsynced;
                        uin_TimingEngineS3.radioRxEn    <= uin_TimingEngineS3.radioRxEnUnsynced;
                end
        end

endmodule

