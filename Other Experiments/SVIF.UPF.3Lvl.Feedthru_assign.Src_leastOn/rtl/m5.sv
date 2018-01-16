module m5 (input logic          ck,
           input logic          arst,
           in_TimingEngine      uin_TimingEngineS5);

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_TimingEngineS5.radioEnable2 <= 'h0;
                        uin_TimingEngineS5.radioRxEn2   <= 'h0;
                end
                else
                begin
                        uin_TimingEngineS5.radioEnable2 <= uin_TimingEngineS5.radioEnable1;
                        uin_TimingEngineS5.radioRxEn2   <= uin_TimingEngineS5.radioRxEn1;
                end
        end

endmodule

