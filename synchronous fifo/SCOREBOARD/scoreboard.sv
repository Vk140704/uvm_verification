class fifo_scoreboard #(parameter DATA_WIDTH=8)extends uvm_scoreboard;
  
  `uvm_component_utils(fifo_scoreboard)
  
  
  uvm_analysis_imp#(fifo_seq_item,fifo_scoreboard)sb_imp;
  
  function new (string name="Scoreboard",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    sb_imp=new("sb_imp",this);
  endfunction
  
  bit [DATA_WIDTH-1:0]exp_data_out;
  bit [DATA_WIDTH-1:0] queue[$];
  
  function void write(fifo_seq_item item);
    if(!item.rstn) begin
      queue.delete();
      exp_data_out=0;
      `uvm_info("SB","Reset Active - 	Ignored",UVM_LOW);
      return;
    end
    
    else
      begin
        if(item.wr_en && !item.full)
          queue.push_back(item.data_in);
        if(item.rd_en && !item.empty)
          exp_data_out=queue.pop_front();
      end
    if(item.wr_en) begin
      `uvm_info("SB",$sformatf("Write occur--->input=%0d",item.data_in),UVM_LOW)
    end
    
    if(item.rd_en) begin
  if(item.data_out == exp_data_out)
    `uvm_info("SB",$sformatf("Test case PASS--->Input=%0d |Output =%0d",item.data_in,item.data_out),UVM_LOW)
  else
    `uvm_error("SB","Test case FAIL")
end

  endfunction
endclass
    
  
    
    
    
  
