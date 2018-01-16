module m3 (in_TimingEngine uin_TimingEngineS3);

	assign uin_TimingEngineS3.radioEnableUnsynced = uin_TimingEngineS3.radioEnableSynced2;
	assign uin_TimingEngineS3.radioRxEnUnsynced   = uin_TimingEngineS3.radioRxEnSynced2;

endmodule

