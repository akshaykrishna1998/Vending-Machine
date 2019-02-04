module displaydigit(input [3:0] hexa, output reg [6:0] D);

		always@hexa
		begin

		case(hexa)
			4'h0:
			begin
				D[0] <= 1'b0;
				D[1] <= 1'b0;
				D[2] <= 1'b0;
				D[3] <= 1'b0;
				D[4] <= 1'b0;
				D[5] <= 1'b0;
				D[6] <= 1'b1;
			end
			4'h1:
			begin
				D[0] <= 1'b1;
				D[1] <= 1'b0;
				D[2] <= 1'b0;
				D[3] <= 1'b1;
				D[4] <= 1'b1;
				D[5] <= 1'b1;
				D[6] <= 1'b1;
			end	
			4'h2:
			begin
				D[0] <= 1'b0;
				D[1] <= 1'b0;
				D[2] <= 1'b1;
				D[3] <= 1'b0;
				D[4] <= 1'b0;
				D[5] <= 1'b1;
				D[6] <= 1'b0;
			end	
			4'h3:
			begin
				D[0] <= 1'b0;
				D[1] <= 1'b0;
				D[2] <= 1'b0;
				D[3] <= 1'b0;
				D[4] <= 1'b1;
				D[5] <= 1'b1;
				D[6] <= 1'b0;
			end	
			4'h4: // L
			begin
				D[3] <= 1'b0;
				D[5] <= 1'b0;
				D[4] <= 1'b0;
				D[0] <= 1'b1;
				D[1] <= 1'b1;
				D[2] <= 1'b1;
				D[6] <= 1'b1;
			end		
			4'h5:
			begin
				D[0] <= 1'b0;
				D[1] <= 1'b1;
				D[2] <= 1'b0;
				D[3] <= 1'b0;
				D[4] <= 1'b1;
				D[5] <= 1'b0;
				D[6] <= 1'b0;
			end	
			4'h6: // -
			begin
				D[0] <= 1'b1;
				D[1] <= 1'b1;
				D[2] <= 1'b1;
				D[3] <= 1'b1;
				D[4] <= 1'b1;
				D[5] <= 1'b1;
				D[6] <= 1'b0;
			end	
			4'h7:
			begin
				D[0] <= 1'b0;
				D[1] <= 1'b0;
				D[2] <= 1'b0;
				D[3] <= 1'b1;
				D[4] <= 1'b1;
				D[5] <= 1'b1;
				D[6] <= 1'b1;
			end	
			4'h8:
			begin
				D[0] <= 1'b0;
				D[1] <= 1'b0;
				D[2] <= 1'b0;
				D[3] <= 1'b0;
				D[4] <= 1'b0;
				D[5] <= 1'b0;
				D[6] <= 1'b0;
			end	
			4'h9: // H
			begin
				D[1] <= 1'b0;
				D[2] <= 1'b0;
				D[4] <= 1'b0;
				D[5] <= 1'b0;
				D[6] <= 1'b0;
				D[0] <= 1'b1;
				D[3] <= 1'b1;
			end		
			4'hA:
			begin
				D[0] <= 1'b0;
				D[1] <= 1'b0;
				D[2] <= 1'b0;
				D[3] <= 1'b1;
				D[4] <= 1'b0;
				D[5] <= 1'b0;
				D[6] <= 1'b0;
			end	
			4'hB:
			begin
				D[0] <= 1'b1;
				D[1] <= 1'b1;
				D[2] <= 1'b0;
				D[3] <= 1'b0;
				D[4] <= 1'b0;
				D[5] <= 1'b0;
				D[6] <= 1'b0;
			end	
			4'hC:
			begin
				D[0] <= 1'b0;
				D[1] <= 1'b1;
				D[2] <= 1'b1;
				D[3] <= 1'b0;
				D[4] <= 1'b0;
				D[5] <= 1'b0;
				D[6] <= 1'b1;
			end	
			4'hD:
			begin
				D[0] <= 1'b1;
				D[1] <= 1'b0;
				D[2] <= 1'b0;
				D[3] <= 1'b0;
				D[4] <= 1'b0;
				D[5] <= 1'b1;
				D[6] <= 1'b0;
			end	
			4'hE:
			begin
				D[0] <= 1'b0;
				D[1] <= 1'b1;
				D[2] <= 1'b1;
				D[3] <= 1'b0;
				D[4] <= 1'b0;
				D[5] <= 1'b0;
				D[6] <= 1'b0;
			end	
			4'hF: //null
			begin
				D[0] <= 1'b1;
				D[1] <= 1'b1;
				D[2] <= 1'b1;
				D[3] <= 1'b1;
				D[4] <= 1'b1;
				D[5] <= 1'b1;
				D[6] <= 1'b1;
			end	
		endcase
		end
endmodule