module m4 (input logic          ck,
           input logic          arst,
           in_TimingEngine      uin_TimingEngineS2);

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_TimingEngineS2.radioEnableSynced2 <= 'h0;
                        uin_TimingEngineS2.radioRxEnSynced2   <= 'h0;
                end
                else
                begin
                        uin_TimingEngineS2.radioEnableSynced2 <= uin_TimingEngineS2.radioEnableSynced1;
                        uin_TimingEngineS2.radioRxEnSynced2   <= uin_TimingEngineS2.radioRxEnSynced1;
                end
        end

endmodule

