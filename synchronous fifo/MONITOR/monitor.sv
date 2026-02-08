class fifo_monitor extends uvm_monitor;
  `uvm_component_utils(fifo_monitor)
  
  fifo_seq_item item;
  virtual fifo_inf vif;
  
  uvm_analysis_port #(fifo_seq_item)mon_ap;
  
  
  function new(string name="monitor",uvm_component parent);
    
    super.new(name,parent);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db #(virtual fifo_inf)::get(this,"","vif",vif)))
       `uvm_fatal("MONITOR","Virtual interface is not found")
      mon_ap=new("mon_ap",this);
      endfunction
      
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
    
    forever begin
      @(posedge vif.clk);
      #1;
      
      item=fifo_seq_item#()::type_id::create("item");
      
      item.rstn = vif.rstn;
      item.wr_en = vif.wr_en;
      item.rd_en = vif.rd_en;
      item.data_in=vif.data_in;
      item.data_out = vif.data_out;
      item.full=vif.full;
      item.empty=vif.empty;
      
      mon_ap.write(item);
      
    end
   endtask
endclass
      
      
    
