//====================================================================  
//        Copyright (c) 2012 Nordic Semiconductor ASA, Norway           
//====================================================================  
// Created       : Omer Qadir at 2012-02-24                                 
// Modified      : $Author$ $Date$                                      
// Version       : $Revision$ $HeadURL$                                 
//====================================================================  

interface in_TimingEngine #(
  	// -- Timing Engine
   	parameter SIZE_SPISLAVE_T_ARSTFS	= 1 // pa_MpwSpiSlave::SIZE_SPISLAVE_T_ARSTFS
  	) ();

	// -- Signals To TimingEngine:;
	reg					pllSettled;
	logic	[SIZE_SPISLAVE_T_ARSTFS	-1:0]	tArstFs;

	logic					radioEnableSynced;
	logic					radioRxEnSynced;
	logic					radioEnable;
	logic					radioRxEn;

	modport	Stage1 (
		 input	pllSettled
		,input	tArstFs

		,output	radioEnableSynced
		,output	radioRxEnSynced
	);
	
	modport Stage2 (
		 input	radioEnableSynced
		,input	radioRxEnSynced
			
		,output	radioEnable
		,output radioRxEn
	);

endinterface
