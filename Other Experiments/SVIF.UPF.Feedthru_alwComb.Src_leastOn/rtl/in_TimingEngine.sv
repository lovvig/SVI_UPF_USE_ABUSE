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
	logic					radioEnableUnsynced;
	logic					radioRxEnSynced;
	logic					radioRxEnUnsynced;
	logic					radioEnable;
	logic					radioRxEn;

	modport	Stage1 (
		/*FF in this stage*/
		 input	pllSettled
		,input	tArstFs

		,output	radioEnableSynced
		,output	radioRxEnSynced
	);
	
	modport Stage2 (
		/*Assign in this stage*/
		 input	radioEnableSynced
		,input	radioRxEnSynced
			
		,output	radioEnableUnsynced
		,output radioRxEnUnsynced
	);
	
	modport	Stage3 (
		/*FF in this stage*/
		 input	radioEnableUnsynced
		,input	radioRxEnUnsynced

		,output	radioEnable
		,output	radioRxEn
	);
	
endinterface
