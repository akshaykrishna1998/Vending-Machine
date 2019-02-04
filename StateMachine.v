
module StateMachine
(
	input clk,
	input reset,	
	input B0,
	input B1,
	input B2,
	input B3,
	input [3:0] S3_0,
	input [3:0] S8_5,
	//input S9,
	input [2:0] cs_pc, 
	input [2:0] cs_cb, 
	input [2:0] cs_s, 
	input [2:0] cs_c,
	
	output reg [2:0] state,
	output reg [7:0] item_code,
	output reg [3:0] money_inserted,
	output reg [3:0] money_refunded,
	output reg decrement
);

reg [3:0] elapsed_time;
reg [25:0] slow_clk;
reg [2:0] next_state;
reg init;

localparam [7:0]  potato_chips = 8'hA2,
					   candy_bar = 8'hB3,
					   soda = 8'hD5,
					   cookie = 8'hE8; 
				
localparam  price_potato_chips = 4'h5,
				price_candy_bar = 4'h4,
				price_soda = 4'h9,
				price_cookie = 4'h3;

localparam [2:0] idle=3'b001,
					  display_price=3'b010,
					  display_oos=3'b011,
					  insert_money=3'b100,
					  refund=3'b101 ;

//has count of the money inserted and money refunded
always@(posedge clk)
begin
	if(reset||B0)
	begin
		money_inserted = 4'h0;
		money_refunded = 4'h0;
	end
	else if(B3 == 1)
		begin
		money_refunded = money_inserted;
		end
	else if(state == refund && money_refunded!=money_inserted)
	begin
		if(item_code==potato_chips)
		begin
		money_refunded = money_inserted - price_potato_chips;
		end
		else if(item_code==candy_bar)
		begin
		money_refunded = money_inserted - price_candy_bar;
		end
		else if(item_code==soda)
		begin
		money_refunded = money_inserted - price_soda;
		end
		else if(item_code==cookie)
		begin
		money_refunded = money_inserted - price_cookie;
		end

	end
	else if( B1==1 )
	begin
		money_inserted = money_inserted + 4'h1;
		//money_refunded = money_inserted;
	end
	else if(B2 == 1)
	begin
		money_inserted = money_inserted + 4'h4;
		//money_refunded = money_inserted;
	end
	
end

//count each second

always @ (posedge clk)
begin

if(reset || init)
begin
 slow_clk <= 26'd0;
 elapsed_time <= 4'h0;
end

else
begin
    if (slow_clk == 26'd50_000_000) 
	 //if(slow_clk == 26'd300)
	 begin
        elapsed_time <= elapsed_time + 4'h1;
        slow_clk <= 26'd0;
    end
    else 
	 begin
        slow_clk <= slow_clk + 26'd1;
    end
end

end
		
always@* 
begin

init=1'b0;
decrement = 1'b0;

next_state = state;
case (state) 

idle : 
		 if (B0)
		 begin
			item_code = {S8_5,S3_0};
			if((item_code==potato_chips||
			item_code==candy_bar||
			item_code==soda||
			item_code==cookie) &&
			((item_code==potato_chips &&cs_pc != 3'b000)||
			 (item_code==candy_bar &&cs_cb != 3'b000)||
			 (item_code==soda &&cs_s != 3'b000)||
			 (item_code==cookie &&cs_c != 3'b000)
			))
			 begin
			 next_state = display_price;
			 init=1'b1;
			 decrement = 1'b0;
			 end 
			 else 
			 begin 
			 next_state = display_oos; 
			 init=1'b1;
			 decrement = 1'b0;
			 end 
		 end
			 
display_oos: 
 
		 if (elapsed_time >4'h3)
		 begin 
		 next_state = idle; 
		 init=1'b1;
		 decrement = 1'b0;
		 end 

display_price :
begin
		if(B1||B2 && elapsed_time<=4'h5) 
		begin
		next_state = insert_money; 
		init=1'b1;
		decrement = 1'b0;
		end 
		else if (elapsed_time >4'h5)
		begin
		next_state = idle;
		init=1'b1;
		decrement = 1'b0;
		end 
end

insert_money: 
begin
if(B3)
	begin
		next_state = refund;
		init=1'b1;
		decrement = 1'b0;
	end	

else if((item_code==potato_chips)&&(money_inserted>price_potato_chips))
	begin
		next_state = refund;
		decrement = 1'b1;
		init=1'b1;
	end
else if((item_code==candy_bar)&&(money_inserted>price_candy_bar))
	begin
		next_state = refund;
		decrement = 1'b1;
		init=1'b1;
	end
else if((item_code==soda)&&(money_inserted>price_soda))
	begin
		next_state = refund;
		decrement = 1'b1;
		init=1'b1;
	end
else if((item_code==cookie)&&(money_inserted>price_cookie))
	begin
		next_state = refund;
		decrement = 1'b1;
		init=1'b1;
	end
else if((item_code==potato_chips)&&(money_inserted==price_potato_chips))
	begin
		next_state = idle;
		decrement = 1'b1;
		init=1'b1;
	end
else if((item_code==candy_bar)&&(money_inserted==price_candy_bar))
	begin
		next_state = idle;
		decrement = 1'b1;
		init=1'b1;
	end
else if((item_code==soda)&&(money_inserted==price_soda))
	begin
		next_state = idle;
		decrement = 1'b1;
		init=1'b1;
	end
else if((item_code==cookie)&&(money_inserted==price_cookie))
	begin
		next_state = idle;
		decrement = 1'b1;
		init=1'b1;
	end
end

refund:
begin
		if(elapsed_time>4'h5)
		begin
			next_state=idle;
			init=1'b1;
			decrement = 1'b0;
		end
end	
endcase		
end

always @(posedge clk)
begin
	if(reset)
	begin
		state<= idle;
	end
	else
	begin
		state<= next_state;
	end
end


endmodule
