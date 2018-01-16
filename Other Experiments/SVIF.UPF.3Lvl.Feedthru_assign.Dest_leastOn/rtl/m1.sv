module m1 (input logic          ck,
           input logic          arst,
           in_TimingEngine      uin_TimingEngineS1,
           in_TimingEngine      uin_TimingEngineS2);

	/* Module instantiation */
	m4 u_m4 (.ck                    (ck),
                 .arst                  (arst),
                 .uin_TimingEngineS2    (uin_TimingEngineS2));

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_TimingEngineS1.radioEnableSynced1 <= 'h0;
                        uin_TimingEngineS1.radioRxEnSynced1   <= 'h0;
                end
                else
                begin
                        uin_TimingEngineS1.radioEnableSynced1 <= uin_TimingEngineS1.pllSettled;
                        uin_TimingEngineS1.radioRxEnSynced1   <= uin_TimingEngineS1.tArstFs;
                end
        end

endmodule

