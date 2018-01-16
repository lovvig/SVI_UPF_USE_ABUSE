module m2 (input logic          ck,
           input logic          arst,
           in_TimingEngine      uin_TimingEngineS2);

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_TimingEngineS2.radioEnable  <= 'h0;
                end
                else
                begin
                        uin_TimingEngineS2.radioEnable  <= uin_TimingEngineS2.radioEnableSynced;
                end
        end

endmodule
