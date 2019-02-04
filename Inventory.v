module Inventory
(
	input  clk, 
	input reset,
	//input S9, 
	input decrement,
	input [7:0] item_code,
	
	output reg [2:0] cs_pc, 
	output reg [2:0] cs_cb, 
	output reg [2:0] cs_s, 
	output reg [2:0] cs_c
);

localparam [7:0]  potato_chips = 8'hA2,
					   candy_bar = 8'hB3,
					   soda = 8'hD5,
					   cookie = 8'hE8; 

always@(posedge clk) 
if (reset) 
begin 
	cs_pc <= 3'd5;
	cs_cb <= 3'd4;
	cs_s <= 3'd3;
	cs_c <= 3'd3;
end

else 
begin
	if (decrement==1) 
	begin 
 
		if (item_code==potato_chips)
		begin 
		cs_pc <= cs_pc-3'b1 ;
		end 

		else if ( item_code ==candy_bar) 
		begin  
		cs_cb <= cs_cb -3'b1; 
		end 

		else if (item_code == soda) 
		begin  
		cs_s <= cs_s -3'b1; 
		end 

		else if (item_code ==cookie) 
		begin 
		cs_c <= cs_c -3'b1; 
		end 
	end
end 

endmodule
