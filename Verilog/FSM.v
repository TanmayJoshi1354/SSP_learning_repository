module FSM(
    input clk,
    input rst,
    output reg[2:0] N,
    output reg[2:0] S,
    output reg[2:0] W,
    output reg[2:0] E
    );
// The input clk will give a clock for the FSM, rst is the reset input,
// while the outputs of N,S,W,E correspond to the Northward, Southward,
// Westward and Eastward traffic signals. In these,
// 001 corresponds to green lights, 010 to yellow and 100 to red.    
reg [2:0] state;
// state register stores current state of FSM
parameter[2:0] ng = 3'b000;
parameter[2:0] ny = 3'b001;
parameter[2:0] sg = 3'b010;
parameter[2:0] sy = 3'b011;
parameter[2:0] wg = 3'b100;
parameter[2:0] wy = 3'b101;
parameter[2:0] eg = 3'b110;
parameter[2:0] ey = 3'b111;
//These parameters are the individual states achievable by the FSM
reg[2:0] count;
//We'll change state after 8 clock cycles. The count register keeps a
//track of this.
always@(posedge clk, posedge rst)
  begin
   if(rst)
     begin
       state = ng;
       count = 3'b000;
       //If rst pin is high, keep the state as northward green lights
     end 
    else
      begin
       case(state)
       //For each state, if count has reached the highest, move to the next state
       // Else increase count by one, keeping the state same.
       ng:
         begin
           if(count==3'b111)
             begin
               state = ny;
               count = 3'b000;
             end
           else
             begin
               state = ng;
               count = count + 1;
             end      
         end
         
        ny:
          begin
           if(count==3'b111)
             begin
               state = sg;
               count = 3'b000;
             end
           else
             begin
               state = ny;
               count = count + 1;
             end      
         end
         
        sg:
         begin
           if(count==3'b111)
             begin
               state = sy;
               count = 3'b000;
             end
           else
             begin
               state = sg;
               count = count + 1;
             end      
         end
                        
        sy:
         begin
           if(count==3'b111)
             begin
               state = wg;
               count = 3'b000;
             end
           else
             begin
               state = sy;
               count = count + 1;
             end      
         end
         
        wg:
         begin
           if(count==3'b111)
             begin
               state = wy;
               count = 3'b000;
             end
           else
             begin
               state = wg;
               count = count + 1;
             end      
         end
        
        wy:
         begin
           if(count==3'b111)
             begin
               state = eg;
               count = 3'b000;
             end
           else
             begin
               state = wy;
               count = count + 1;
             end      
         end
                   
        eg:
         begin
           if(count==3'b111)
             begin
               state = ey;
               count = 3'b000;
             end
           else
             begin
               state = eg;
               count = count + 1;
             end      
         end
            
        ey:
         begin
           if(count==3'b111)
             begin
               state = ng;
               count = 3'b000;
             end
           else
             begin
               state = ey;
               count = count + 1;
             end      
         end    
       endcase                             
      end
     end
     
always @(state)
    begin
        case(state)
        //Assign relevant output values for each traffic light corresponding to
        //Each state.
            ng:
                begin
                    N = 3'b001;
                    S = 3'b100;
                    E = 3'b100;
                    W = 3'b100;
                end
            ny:
                begin
                    N = 3'b010;
                    S = 3'b100;
                    E = 3'b100;
                    W = 3'b100;
                end
            sg:
                begin
                    N = 3'b100;
                    S = 3'b001;
                    E = 3'b100;
                    W = 3'b100;
                end
            sy:
                begin
                    N = 3'b100;
                    S = 3'b010;
                    E = 3'b100;
                    W = 3'b100;
                end
            wg:
                begin
                    N = 3'b100;
                    S = 3'b100;
                    E = 3'b100;
                    W = 3'b001;
                end
            wy:
                begin
                    N = 3'b100;
                    S = 3'b100;
                    E = 3'b100;
                    W = 3'b010;
                end
            eg:
                begin
                    N = 3'b100;
                    S = 3'b100;
                    E = 3'b001;
                    W = 3'b100;
                end
            ey:
                begin
                    N = 3'b100;
                    S = 3'b100;
                    E = 3'b010;
                    W = 3'b100;
                end                            
        endcase
    end               
endmodule
