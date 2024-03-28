module lab2_ex2 (
	input logic rst, clk,
	input logic w,
	output logic out, 
	output logic [3:0] state
);

always_comb begin
	case (state_reg)
		A : state = 4'b0000;
		B : state = 4'b0001;
		C : state = 4'b0010;
		D : state = 4'b0011;
		E : state = 4'b0100;
		F : state = 4'b0101;
		G : state = 4'b0110;
		H : state = 4'b0111;
		I : state = 4'b1000;
	endcase
end

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