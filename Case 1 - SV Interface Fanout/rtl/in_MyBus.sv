//====================================================================  
//        Copyright (c) 2018 Nordic Semiconductor ASA, Norway           
//====================================================================  
// Created       : Omer Qadir at 2012-02-24                                 
// Modified      : $Author$ $Date$                                      
// Version       : $Revision$ $HeadURL$                                 
//====================================================================  

interface in_MyBus #(
	)();
	// -- Signals To TimingEngine:;
	reg		start;
	logic		data;

	logic		ready;
	logic		dataReady;
	logic		execute1;
	logic		dataTx1;
	logic		execute2;
	logic		dataTx2;

	modport	Stage1 (
		 input	start
		,input	data

		,output	ready
		,output	dataReady
	);
	
	modport Stage2 (
		 input	ready
		,input	dataReady
	);
	
	
  	modport	Stage3 (
		 output	execute1
		,output dataTx1
	);
	
	modport Stage4 (
		 output execute2
		,output dataTx2
	);
	
endinterface
