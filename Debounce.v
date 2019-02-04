module Debounce
(
	input B,
	input clk,
	
	output b
);

reg w0,w1;

always @ (posedge clk)
begin
w0<=B;
end

always @ (posedge clk)
begin
w1<=w0;
end

assign b = w0 & ~w1;

endmodule
