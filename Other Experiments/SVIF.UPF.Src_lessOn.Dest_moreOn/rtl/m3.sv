module m3 (in_TimingEngine uin_TimingEngine);

	always_comb uin_TimingEngine.radioEnable = uin_TimingEngine.radioEnableSynced;
	always_comb uin_TimingEngine.radioRxEn = uin_TimingEngine.radioRxEnSynced;

endmodule

