module lab2_ex2 (
	input logic rst, clk,
	input logic w,
	output logic out, 
	output logic [8:0] state
);

assign state[0] = (state_reg == A);
assign state[1] = (state_reg == B);
assign state[2] = (state_reg == C);
assign state[3] = (state_reg == D);
assign state[4] = (state_reg == E);
assign state[5] = (state_reg == F);
assign state[6] = (state_reg == G);
assign state[7] = (state_reg == H);
assign state[8] = (state_reg == I);

typedef enum bit [3:0]	{A = 4'b0000, B = 4'b0001, C = 4'b0010, D = 4'b0011,E = 4'b0100, F = 4'b0101, G = 4'b0110, H = 4'b0111, I = 4'b1000} state_t;
state_t state_reg, state_next;

always_ff @(posedge clk or negedge rst)
	if (!rst)
		state_reg <= A;
	else 
		state_reg <= state_next;

always_comb begin
	state_next = state_reg;	
	out = 1'b0;						//default output
	unique case (state_reg)
		A:	begin
			out = 1'b0;
			if (!rst)
				state_next = A;
			else if (!w)
				state_next = B;
			else if (w)
				state_next = F;
			end
		B: begin
			out = 1'b0;
			if (!w)
				state_next = C;
			else if (w)
				state_next = F;
			end
		C: begin
			out = 1'b0;
			if (!w)
				state_next = D;
			else if (w)
				state_next = F;
			end
		D: begin
			out = 1'b0;
			if (!w)
				state_next = E;
			else if (w)
				state_next = F;
			end
		E:	begin
			out = 1'b1;
			if (!w)
				state_next = E;
			else if (w)
				state_next = F;
			end
		F: begin
			out = 1'b0;
			if (!w)
				state_next = B;
			else if (w)
				state_next = G;
			end
		G: begin
			out = 1'b0;
			if (!w)
				state_next = B;
			else if (w)
				state_next = H;
			end
		H: begin 
			out = 1'b0;
			if (!w)
				state_next = B;
			else if (w)
				state_next = I;
			end
		I: begin
			out = 1'b1;
			if (!w)
				state_next = B;
			else if (w)
				state_next = I;
			end
	endcase
end
endmodule