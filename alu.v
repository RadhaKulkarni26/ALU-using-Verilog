module ALU(
           input [7:0] Input_1,Input_2,                              
           input [3:0] Select_Input,           
           output [7:0] Output_Signal,          
           output Carry_Output                
    );
    reg [7:0] Final_Result;
    wire [8:0] tmp;
    assign Output_Signal = Final_Result;          
    assign tmp = {1'b0,Input_1} + {1'b0,Input_2};
    assign Carry_Output = tmp[8];            
    always @(*)
    begin
        case(Select_Input)
        4'b0000:
           Final_Result = Input_1 + Input_2 ; 
        4'b0001: 
           Final_Result = Input_1 - Input_2 ;
        4'b0010: 
           Final_Result = Input_1 * Input_2;
        4'b0011: 
           Final_Result = Input_1/Input_2;
        4'b0100: // Logical shift left
           Final_Result = Input_1<<1;
         4'b0101: // Logical shift right
           Final_Result = Input_1>>1;
          4'b1000: //  Logical and 
           Final_Result = Input_1 & Input_2;
          4'b1001: //  Logical or
           Final_Result = Input_1 | Input_2;
          4'b1010: //  Logical xor 
           Final_Result = Input_1 ^ Input_2;
          4'b1011: //  Logical nor
           Final_Result = ~(Input_1 | Input_2);
          4'b1100: // Logical nand 
           Final_Result = ~(Input_1 & Input_2);
          4'b1101: // Logical xnor
           Final_Result = ~(Input_1 ^ Input_2);
          4'b1110: // Greater comparison
           Final_Result = (Input_1>Input_2)?8'd1:8'd0 ;
          4'b1111: // Equal comparison   
            Final_Result = (Input_1==Input_2)?8'd1:8'd0 ;
          default: Final_Result = Input_1 + Input_2 ; 
        endcase
    end

endmodule