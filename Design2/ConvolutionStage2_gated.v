/*
	Author: Aniket Badhan
	Description: Multiplication stage of Convolution Layer 2, convolution of outputs at stage 1
*/

`timescale 1ns / 1ps

module ConvolutionStage2_gated(
		input clk,
		input enable,
		input [5:0] input1,
    	input [5:0] input2,
    	input [5:0] input3,
    	input [5:0] input4,
    	input [5:0] input5,
    	input [5:0] input6,
    	input [5:0] input7,
    	input [5:0] input8,
   		input [5:0] input9,
    	input [5:0] input10,
    	input [5:0] input11,
    	input [5:0] input12,
	
    	output reg signed [11:0] output1,
    	output reg signed [11:0] output2,
    	output reg signed [11:0] output3,
    	output reg signed [11:0] output4,
    	output reg signed [11:0] output5,
    	output reg signed [11:0] output6,
		output reg done
    );
	always @ (posedge clk) begin
    	if(enable) begin
            output1 <= {{6{input1[5]}}, input1} * {{6{input7[5]}}, input7};
    	    output2 <= {{6{input2[5]}}, input2} * {{6{input8[5]}}, input8};
    	    output3 <= {{6{input3[5]}}, input3} * {{6{input9[5]}}, input9};
            output4 <= {{6{input4[5]}}, input4} * {{6{input10[5]}}, input10};
            output5 <= {{6{input5[5]}}, input5} * {{6{input11[5]}}, input11};
			output6 <= {{6{input6[5]}}, input6} * {{6{input12[5]}}, input12};
        	done <= 1'b1;
    	end else begin
        	output1 <= 0;
        	output2 <= 0;
        	output3 <= 0;
        	output4 <= 0;
        	output5 <= 0;
        	output6 <= 0;
        	done <= 1'b0;
    	end
	end
		
endmodule
