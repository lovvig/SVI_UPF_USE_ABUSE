module m3 (in_TimingEngine uin_TimingEngineS2);

	assign uin_TimingEngineS2.radioEnableUnsynced = uin_TimingEngineS2.radioEnableSynced;
	assign uin_TimingEngineS2.radioRxEnUnsynced   = uin_TimingEngineS2.radioRxEnSynced;

endmodule

