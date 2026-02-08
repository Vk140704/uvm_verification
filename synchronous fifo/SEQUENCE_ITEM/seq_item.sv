class fifo_seq_item #(parameter DATA_WIDTH=8) extends uvm_sequence_item;
  
  `uvm_object_utils(fifo_seq_item)
  
  function new(string name="seq_item");
    super.new(name);
  endfunction
  
  bit clk;
  bit rstn;
  rand bit wr_en;
  rand bit rd_en;
  rand bit [DATA_WIDTH-1:0]data_in;
  bit [DATA_WIDTH-1:0]data_out;
  bit full,empty;
  
  
  constraint wr_rd_c {
  wr_en ^ rd_en;  // either write OR read, not both
}

endclass
