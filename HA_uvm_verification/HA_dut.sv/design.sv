
module HA(
  
  input logic [3:0]a,
  input logic [3:0]b,
  output logic [3:0]sum,
  output logic carry
         );
  
  logic [4:0]temp;
  
  assign temp=a+b;
  
  
  assign {sum,carry}={temp[3:0],temp[4]};
  
  
endmodule
