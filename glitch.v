`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 06/29/2024 10:28:04 PM
// Design Name: 
// Module Name: glitch
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////


module glitch(
    input a,
    input clk,
    output reg y,
    output reg x
    
    );
    always@(posedge clk)
    begin
    y <= a + !a;
    x <= a * (!a);
    end
endmodule

Test bench :
module tb_glitch;
    reg a;
    reg clk;

    // Outputs
    wire y;
    wire x;


    glitch uut (
        .a(a), 
        .clk(clk), 
        .y(y), 
        .x(x)
    );


    initial begin
        clk = 0;
        forever #5 clk = ~clk; // 10ns clock period
    end

    initial begin

        a = 0;


        #100;
        
        a = 1; #10;
        a = 0; #10;
        a = 1; #10;
        a = 0; #10;

        #100;
        $finish;
    end

    initial begin
        $monitor("Time = %0d, a = %b, clk = %b, y = %b, x = %b", $time, a, clk, y, x);
    end

endmodule
