// Code your design here
module sync_fifo#(parameter DEPTH=8,DATA_WIDTH=8)
  (
    input logic clk,rstn,
    input logic wr_en,rd_en,
    input logic [DATA_WIDTH-1:0]data_in,
    output logic [DATA_WIDTH-1:0]data_out,
    output logic full,empty
  );
  
  logic [$clog2(DEPTH)-1:0]w_ptr,r_ptr;
  
  logic [DATA_WIDTH-1:0]fifo[DEPTH];
  
  always_ff @(posedge clk) begin
    if(~rstn)begin
      w_ptr<=0;
      r_ptr<=0;
      data_out<=0;
    end
  
    else begin
      if(wr_en & !full)begin
      fifo[w_ptr] <= data_in;
      w_ptr <= w_ptr + 1;
    end
     if(rd_en & !empty) begin
      data_out <= fifo[r_ptr];
      r_ptr <= r_ptr + 1;
    end
  end
  end
  
   assign full = ((w_ptr+1'b1) == r_ptr);
   assign empty = (w_ptr == r_ptr);
endmodule
  
  
  
