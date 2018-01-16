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

	logic					radioEnableSynced1;
	logic					radioEnableSynced2;
	logic					radioRxEnSynced1;
	logic					radioRxEnSynced2;

	logic					radioEnableUnsynced;
	logic					radioRxEnUnsynced;
	logic					radioEnable1;
	logic					radioEnable2;
	logic					radioRxEn1;
	logic					radioRxEn2;

	modport	Stage1 (
		/*FF in this stage*/
		 input	pllSettled
		,input	tArstFs

		,output	radioEnableSynced1
		,output	radioRxEnSynced1
	);

	modport	Stage2 (
		/*FF in this stage*/
		 input	radioEnableSynced1
		,input	radioRxEnSynced1

		,output	radioEnableSynced2
		,output	radioRxEnSynced2
	);
		
	modport Stage3 (
		/*Assign in this stage*/
		 input	radioEnableSynced2
		,input	radioRxEnSynced2
			
		,output	radioEnableUnsynced
		,output radioRxEnUnsynced
	);
	
	modport	Stage4 (
		/*FF in this stage*/
		 input	radioEnableUnsynced
		,input	radioRxEnUnsynced

		,output	radioEnable1
		,output	radioRxEn1
	);
	
	modport	Stage5 (
		/*FF in this stage*/
		 input	radioEnable1
		,input	radioRxEn1

		,output	radioEnable2
		,output	radioRxEn2
	);
	
endinterface
