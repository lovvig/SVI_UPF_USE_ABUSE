module m3 (in_TimingEngine uin_TimingEngineS2);

	always_comb uin_TimingEngineS2.radioEnableUnsynced = uin_TimingEngineS2.radioEnableSynced;
	always_comb uin_TimingEngineS2.radioRxEnUnsynced   = uin_TimingEngineS2.radioRxEnSynced;

endmodule

