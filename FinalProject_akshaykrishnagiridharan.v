module FinalProject_akshaykrishnagiridharan
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
	
	output [6:0] display0,
	output [6:0] display1,
	output [6:0] display2,
	output [6:0] display3,
	output [6:0] display4,
	output [6:0] display5
);

wire [3:0] req_digit0,
			 req_digit1,
			 req_digit2,
			 req_digit3,
			 req_digit4,
			 req_digit5,
			 money_inserted,
			 money_refunded;

wire [2:0] cs_pc,
			 cs_cb,
			 cs_s,
			 cs_c,
			 state,
			 control;
			 
wire decrement,bu0,bu1,bu2,bu3;

wire [7:0] item_code;


Debounce but0
(
	.B (~B0),
	.clk (clk),
	.b (bu0)
);

Debounce but1
(
	.B (~B1),
	.clk (clk),
	.b (bu1)
);

Debounce but2
(
	.B (~B2),
	.clk (clk),
	.b (bu2)
);

Debounce but3
(
	.B (~B3),
	.clk (clk),
	.b (bu3)
);

StateMachine statemach
(
	.clk (clk), 
	.reset (reset),
	.B0 (bu0),
	.B1 (bu1),
	.B2 (bu2),
	.B3 (bu3),
	.S3_0 (S3_0),
	.S8_5 (S8_5),
	//.S9 (S9),
	.cs_pc (cs_pc), 
	.cs_cb (cs_cb), 
	.cs_s (cs_s), 
	.cs_c (cs_c),
	
	.state (control),
	.item_code (item_code),
	.money_inserted (money_inserted),
	.money_refunded (money_refunded),
	.decrement (decrement)
);

Inventory inv
(
	.clk (clk),
	.reset(reset),
	//.S9 (S9), 
	.decrement (decrement),
	.item_code (item_code),
	
	.cs_pc (cs_pc), 
	.cs_cb (cs_cb), 
	.cs_s (cs_s), 
	.cs_c (cs_c)
);

Display disp
(
	.control (control),
	.itemcode (item_code),
	.insertedmoney (money_inserted),
	.refundmoney (money_refunded),

	.req_digit0 (req_digit0),
	.req_digit1 (req_digit1),
	.req_digit2 (req_digit2),
	.req_digit3 (req_digit3),
	.req_digit4 (req_digit4),
	.req_digit5 (req_digit5)
);

displaydigit d0
(
	.hexa (req_digit0), 
	.D (display0)
);

displaydigit d1
(
	.hexa (req_digit1), 
	.D (display1)
);

displaydigit d2
(
	.hexa (req_digit2), 
	.D (display2)
);

displaydigit d3
(
	.hexa (req_digit3), 
	.D (display3)
);

displaydigit d4
(
	.hexa (req_digit4), 
	.D (display4)
);

displaydigit d5
(
	.hexa (req_digit5), 
	.D (display5)
);


endmodule
