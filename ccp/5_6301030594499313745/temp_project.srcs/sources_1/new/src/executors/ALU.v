`timescale 1ns / 1ps

module ALU(
	input [31:0] A,
	input [31:0] B,
	input [3:0] AluOP,
	output equ,
	output reg [31:0] r1,
	output reg [31:0] r2
	);
	reg [63:0] result;
	assign equ = ( A == B ) ? 1:0;
	always @ (*)
	begin
		case(AluOP)
		4'b0000: begin
			r1 = A << B;
			r2 = 0;
			end
		
		4'b0001: begin
			r2 = 0;
			// if ( B[31] == 0 )
			// 	r1 = A >> B;
			// else
			// 	r1 = ( A >> B ) | ( ~( 32'hffffffff >> B ));
			// end
			r1 = $signed(A) >>> B;
		end
		4'b0010: begin
			r1 = A >> B;
			r2 = 0;
			end
			
		4'b0011: begin
			result = A * B;
			r1 = result & 32'hffffffff;
			r2 = (result >> 32) & 32'hffffffff;
			end
			
		4'b0100: begin
			r1 = A / B;
			r2 = A % B;
			end
			
		4'b0101: begin
			r1 = A + B;
			end
			
		4'b0110: begin
			r1 = B - A;
			end
			
		4'b0111: begin
			r1 = A & B;
			end
			
		4'b1000: begin
			r1 = A | B;
			end
			
		4'b1001: begin
			r1 = A ^ B;
			end
			
		4'b1010: begin
			r1 = ~ ( A | B );
			end
			
		4'b1011: begin  //signed cmp
			r1 = $signed(B) < $signed(A) ? 1:0;
			end
		
		4'b1100: begin  //unsigned cmp
			r1 = B < A ? 1:0;
			end
		4'b1101: begin  
			r1 = $signed(B) > $signed(A) ? 1:0;
			end
		4'b1110: begin  
			r1 = (($signed(B) < $signed(A))||(A==B)) ? 1:0;
			end
		4'b1111: begin  
			r1 = (($signed(B) > $signed(A))|| (A==B) ) ? 1:0;
			end
		endcase
	end
endmodule