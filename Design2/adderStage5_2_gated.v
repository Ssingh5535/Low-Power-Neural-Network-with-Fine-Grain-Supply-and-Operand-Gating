/*
	Author: Aniket Badhan
	Description: Addition stage 5 of Convolution layer 2, convolution of convolved image and convolved pattern
*/

`timescale 1ns / 1ps

module adderStage5_2_gated(
    input [16:0] input1,
    input [16:0] input2,
    output reg [17:0] output1,
	input enable,
    input clk,
	output reg done
    );
	
	always @ (posedge clk) begin
		if(enable) begin
			output1 <= {input1[16], input1} + {input2[16], input2};
			done <= 1'b1;
		end
		else begin
			output1 <= 0;
			done <= 1'b0;
		end
	end
	
endmodule
