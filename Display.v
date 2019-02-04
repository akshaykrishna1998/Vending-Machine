module Display
(
	input [2:0] control,
	input [7:0] itemcode,
	input [3:0] insertedmoney,
	input [3:0] refundmoney,
	output reg [3:0] req_digit0,
	output reg [3:0] req_digit1,
	output reg [3:0] req_digit2,
	output reg [3:0] req_digit3,
	output reg [3:0] req_digit4,
	output reg [3:0] req_digit5
);


localparam [2:0] idle=3'b001,
					  display_price=3'b010,
					  display_oos=3'b011,
					  insert_money=3'b100,
					  refund=3'b101 ;
					  

always@*
begin
			 req_digit0 <= 4'hF;
			 req_digit1 <= 4'hF;
			 req_digit2 <= 4'hF;
			 req_digit3 <= 4'hF;
			 req_digit4 <= 4'hF;
			 req_digit5 <= 4'hF;
	case(control)
	idle:
	begin
					req_digit4 <= 4'h9;
					req_digit3 <= 4'hE;
					req_digit2 <= 4'h4;
					req_digit1 <= 4'h4;
					req_digit0 <= 4'h0;	
	end				
	display_price:
	begin				
					if(itemcode==8'hA2)
						begin
							req_digit5 <=4'hA;
							req_digit4 <=4'h2;
							req_digit2 <=4'h1;
							req_digit1 <=4'h2;
							req_digit0 <=4'h5;
						end
					else if(itemcode==8'hB3)
						begin
							req_digit5 <=4'hB;
							req_digit4 <=4'h3;
							req_digit2 <=4'h1;
							req_digit1 <=4'h0;
							req_digit0 <=4'h0;
						end
					else if(itemcode==8'hD5)
						begin
							req_digit5 <=4'hD;
							req_digit4 <=4'h5;
							req_digit2 <=4'h2;
							req_digit1 <=4'h2;
							req_digit0 <=4'h5;
						end
					else if(itemcode==8'hE8)
						begin
							req_digit5 <=4'hE;
							req_digit4 <=4'h8;
							req_digit2 <=4'h0;
							req_digit1 <=4'h7;
							req_digit0 <=4'h5;
						end
	end					
	display_oos:
	begin			
					req_digit0 <= 4'h6;
					req_digit1 <= 4'h6;
					req_digit2 <= 4'h6;
					req_digit3 <= 4'h6;
					req_digit4 <= 4'h6;
					req_digit5 <= 4'h6;
	end				
	insert_money:
	begin
					req_digit5 <= 4'hE;
					
					if(insertedmoney == 4'h1)
					begin
						req_digit2 <= 4'h0;
						req_digit1 <= 4'h2;
						req_digit0 <= 4'h5;
					end
					
					else if(insertedmoney == 4'h2)
					begin
						req_digit2 <= 4'h0;
						req_digit1 <= 4'h5;
						req_digit0 <= 4'h0;
					end
					
					else if(insertedmoney == 4'h3)
					begin
						req_digit2 <= 4'h0;
						req_digit1 <= 4'h7;
						req_digit0 <= 4'h5;
					end
					
					else if(insertedmoney == 4'h4)
					begin
						req_digit2 <= 4'h1;
						req_digit1 <= 4'h0;
						req_digit0 <= 4'h0;
					end
					
					else if(insertedmoney == 4'h5)
					begin
						req_digit2 <= 4'h1;
						req_digit1 <= 4'h2;
						req_digit0 <= 4'h5;
					end
					
					else if(insertedmoney == 4'h6)
					begin
						req_digit2 <= 4'h1;
						req_digit1 <= 4'h5;
						req_digit0 <= 4'h0;
					end
					
					else if(insertedmoney == 4'h7)
					begin
						req_digit2 <= 4'h1;
						req_digit1 <= 4'h7;
						req_digit0 <= 4'h5;
					end
					
					else if(insertedmoney == 4'h8)
					begin
						req_digit2 <= 4'h2;
						req_digit1 <= 4'h0;
						req_digit0 <= 4'h0;
					end
					
					else if(insertedmoney == 4'h9)
					begin
						req_digit2 <= 4'h2;
						req_digit1 <= 4'h2;
						req_digit0 <= 4'h5;
					end
					
					else if(insertedmoney == 4'hA)
					begin
						req_digit2 <= 4'h2;
						req_digit1 <= 4'h5;
						req_digit0 <= 4'h0;
					end
					
					else if(insertedmoney == 4'hB)
					begin
						req_digit2 <= 4'h2;
						req_digit1 <= 4'h7;
						req_digit0 <= 4'h5;
					end
					
					else if(insertedmoney == 4'hC)
					begin
						req_digit2 <= 4'h3;
						req_digit1 <= 4'h0;
						req_digit0 <= 4'h0;
					end
	end				
	refund:
	begin
					req_digit5 <= 4'hC;
					req_digit2 <= 4'h0;
					req_digit1 <= 4'h0;
					req_digit0 <= 4'h0;
					
					if(refundmoney == 4'h1)
					begin
						req_digit2 <= 4'h0;
						req_digit1 <= 4'h2;
						req_digit0 <= 4'h5;
					end
					
					else if(refundmoney == 4'h2)
					begin
						req_digit2 <= 4'h0;
						req_digit1 <= 4'h5;
						req_digit0 <= 4'h0;
					end
					
					else if(refundmoney == 4'h3)
					begin
						req_digit2 <= 4'h0;
						req_digit1 <= 4'h7;
						req_digit0 <= 4'h5;
					end
					
					else if(refundmoney == 4'h4)
					begin
						req_digit2 <= 4'h1;
						req_digit1 <= 4'h0;
						req_digit0 <= 4'h0;
					end
					
					else if(refundmoney == 4'h5)
					begin
						req_digit2 <= 4'h1;
						req_digit1 <= 4'h2;
						req_digit0 <= 4'h5;
					end
					
					else if(refundmoney == 4'h6)
					begin
						req_digit2 <= 4'h1;
						req_digit1 <= 4'h5;
						req_digit0 <= 4'h0;
					end
					
					else if(refundmoney == 4'h7)
					begin
						req_digit2 <= 4'h1;
						req_digit1 <= 4'h7;
						req_digit0 <= 4'h5;
					end
					
					else if(refundmoney == 4'h8)
					begin
						req_digit2 <= 4'h2;
						req_digit1 <= 4'h0;
						req_digit0 <= 4'h0;
					end
					
					else if(refundmoney == 4'h9)
					begin
						req_digit2 <= 4'h2;
						req_digit1 <= 4'h2;
						req_digit0 <= 4'h5;
					end
					
					else if(refundmoney == 4'hA)
					begin
						req_digit2 <= 4'h2;
						req_digit1 <= 4'h5;
						req_digit0 <= 4'h0;
					end
					
					else if(refundmoney == 4'hB)
					begin
						req_digit2 <= 4'h2;
						req_digit1 <= 4'h7;
						req_digit0 <= 4'h5;
					end
					
					else if(refundmoney == 4'hC)
					begin
						req_digit2 <= 4'h3;
						req_digit1 <= 4'h0;
						req_digit0 <= 4'h0;
					end
	end
	endcase
end

endmodule
