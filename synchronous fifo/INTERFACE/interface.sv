interface fifo_inf#(parameter DEPTH=8, DATA_WIDTH=8);
  logic clk;
  logic rstn;
  logic wr_en;
  logic rd_en;
  logic [DATA_WIDTH-1:0]data_in;
  logic [DATA_WIDTH-1:0]data_out;
  logic full;
  logic empty;
endinterface
