//====================================================================  
//        Copyright (c) 2018 Nordic Semiconductor ASA, Norway           
//====================================================================  
// Created       : Omer Qadir at 2012-02-24                                 
// Modified      : $Author$ $Date$                                      
// Version       : $Revision$ $HeadURL$                                 
//====================================================================  

interface in_MyBus ();
	// -- Signals To TimingEngine:;
	reg		start;
	logic		data;

	logic		ready;
	logic		dataReady;
	logic		execute;
	logic		dataTx;
	//logic		execute2;
	//logic		dataTx2;

	modport	Stage1 (
		 input	start
		,input	data

		,output	ready
		,output	dataReady
	);
	
	modport Stage5 (
		 input	ready
		,input	dataReady
		
		,output execute
		,output dataTx
	);
	
endinterface
