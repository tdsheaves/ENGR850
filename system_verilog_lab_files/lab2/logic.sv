module LDT(input logic res);
logic q, qn, d, clk, resl;
initial begin
clk <= 0;
forever #5 clk=~clk;
end
assign resl=~res;
not a(qn,q);
DFF D(q, d, clk, resl);
endmodule