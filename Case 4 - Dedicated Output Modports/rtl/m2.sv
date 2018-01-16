module m2 (input logic          ck,
           input logic          arst,
  	       input logic		    isolateM1M2,
           in_MyBus             uin_MyBusS5,
	       in_MyBus	            uin_MyBusS6);

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_MyBusS6.execute  <= 'h0;
                end
                else
                begin
                        uin_MyBusS6.execute  <= uin_MyBusS5.ready;
                end
        end

endmodule