module m3 (input logic          ck,
           input logic          arst,
  	       input logic		    isolateM1M3,
           in_MyBus             uin_MyBusS2,
	       in_MyBus	            uin_MyBusS4);

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_MyBusS4.dataTx2   <= 'h0;
                        uin_MyBusS4.execute2  <= 'h0;
                end
                else
                begin
                        uin_MyBusS4.dataTx2   <= uin_MyBusS2.dataReady;
                        uin_MyBusS4.execute2  <= uin_MyBusS2.ready;
                end
        end

endmodule