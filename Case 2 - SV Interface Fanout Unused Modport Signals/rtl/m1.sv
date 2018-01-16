module m1 (input logic      ck,
           input logic      arst,
           in_MyBus         uin_MyBusS1);

        always_ff @(posedge ck or posedge arst)
        begin
                if (arst)
                begin
                        uin_MyBusS1.ready       <= 'h0;
                        uin_MyBusS1.dataReady   <= 'h0;
                end
                else
                begin
                        uin_MyBusS1.ready       <= uin_MyBusS1.start;
                        uin_MyBusS1.dataReady   <= uin_MyBusS1.data;
                end
        end

endmodule
