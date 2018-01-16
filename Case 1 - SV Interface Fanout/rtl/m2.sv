module m2 (input logic          ck,
           input logic          arst,
  	       input logic		    isolateM1M2,
           in_MyBus             uin_MyBusS2,
	       in_MyBus	            uin_MyBusS3);

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_MyBusS3.execute1  <= 'h0;
                        uin_MyBusS3.dataTx1   <= 'h0;
                end
                else
                begin
                        uin_MyBusS3.execute1  <= uin_MyBusS2.ready;
                        uin_MyBusS3.dataTx1   <= uin_MyBusS2.dataReady;
                end
        end

endmodule