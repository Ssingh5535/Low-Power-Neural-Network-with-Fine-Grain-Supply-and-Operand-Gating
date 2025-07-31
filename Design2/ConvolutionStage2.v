/*
	Author: Aniket Badhan
	Description: Multiplication stage of Convolution Layer 2, convolution of outputs at stage 1
*/

`timescale 1ns / 1ps

module ConvolutionStage2(
		input clk,
		input enable,
		input [7:0] input1,
    	input [7:0] input2,
    	input [7:0] input3,
    	input [7:0] input4,
    	input [7:0] input5,
    	input [7:0] input6,
    	input [7:0] input7,
    	input [7:0] input8,
   		input [7:0] input9,
    	input [7:0] input10,
    	input [7:0] input11,
    	input [7:0] input12,
	
    	output reg signed [15:0] output1,
    	output reg signed [15:0] output2,
    	output reg signed [15:0] output3,
    	output reg signed [15:0] output4,
    	output reg signed [15:0] output5,
    	output reg signed [15:0] output6,
		output reg done
    );
	always @ (posedge clk) begin
    	if(enable) begin
        	if (input1 != 0 && input7 != 0) begin
            	output1 <= {{8{input1[7]}}, input1} * {{8{input7[7]}}, input7};
	        end else begin
    	        output1 <= 0;
        	end
        
	        if (input2 != 0 && input8 != 0) begin
    	        output2 <= {{8{input2[7]}}, input2} * {{8{input8[7]}}, input8};
        	end else begin
            	output2 <= 0;
        	end
        
	        if (input3 != 0 && input9 != 0) begin
    	        output3 <= {{8{input3[7]}}, input3} * {{8{input9[7]}}, input9};
        	end else begin
            	output3 <= 0;
        	end
        
        	if (input4 != 0 && input10 != 0) begin
            	output4 <= {{8{input4[7]}}, input4} * {{8{input10[7]}}, input10};
        	end else begin
            	output4 <= 0;
        	end
        
        	if (input5 != 0 && input11 != 0) begin
            	output5 <= {{8{input5[7]}}, input5} * {{8{input11[7]}}, input11};
        	end else begin
            	output5 <= 0;
        	end
        
	        if (input6 != 0 && input12 != 0) begin
    	        output6 <= {{8{input6[7]}}, input6} * {{8{input12[7]}}, input12};
        	end else begin
            	output6 <= 0;
        	end
        
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
