class fifo_agent extends uvm_agent;
  
  `uvm_component_utils(fifo_agent)
  
  fifo_sequencer  sqncr;
  fifo_driver drvr;
  fifo_monitor mntr;
  function new(string name="Agent",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void  build_phase (uvm_phase phase);
    
    super.build_phase(phase);
    
    sqncr=fifo_sequencer::type_id::create("sqncr",this);
    drvr=fifo_driver::type_id::create("drvr",this);
    mntr=fifo_monitor::type_id::create("mntr",this);
    
  endfunction
  
  function void connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    drvr.seq_item_port.connect(sqncr.seq_item_export);
  endfunction
  
endclass
  
