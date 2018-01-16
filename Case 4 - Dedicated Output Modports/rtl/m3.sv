module m3 (input logic          ck,
           input logic          arst,
  	       input logic		    isolateM1M3,
           in_MyBus             uin_MyBusS5,           
	       in_MyBus	            uin_MyBusS7);

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_MyBusS7.dataTx   <= 'h0;
                end
                else
                begin
                        uin_MyBusS7.dataTx   <= uin_MyBusS5.dataReady;
                end
        end

endmodule