//====================================================================  
//        Copyright (c) 2012 Nordic Semiconductor ASA, Norway           
//====================================================================  
// Created       : Omer Qadir at 2012-02-24                                 
// Modified      : $Author$ $Date$                                      
// Version       : $Revision$ $HeadURL$                                 
//====================================================================  

interface in_TimingEngine #(
  	// -- Timing Engine
  	 parameter BIT_WIDTH			= 2
   	,parameter SIZE_SPISLAVE_T_ARSTFS	= BIT_WIDTH
  	) ();

	// -- Signals To TimingEngine:;
	logic	[BIT_WIDTH -1:0]		pllSettled;
	logic	[SIZE_SPISLAVE_T_ARSTFS	-1:0]	tArstFs;

	logic	[BIT_WIDTH -1:0]		radioEnableSynced;
	logic	[BIT_WIDTH -1:0]		radioEnableUnsynced;
	logic	[BIT_WIDTH -1:0]		radioRxEnSynced;
	logic	[BIT_WIDTH -1:0]		radioRxEnUnsynced;

	logic	[BIT_WIDTH -1:0]		radioEnable;
	logic	[BIT_WIDTH -1:0]		radioRxEn;

	modport	Stage1 (
		 input	pllSettled
		,input	tArstFs

		,output	radioEnableSynced
		,output	radioRxEnSynced
	);
	
	modport	Stage2 (
		 input	radioEnableSynced
		,input	radioRxEnSynced

		,output	radioEnable
		,output	radioRxEn
	);

endinterface
