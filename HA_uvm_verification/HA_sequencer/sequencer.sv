class HA_sequencer extends uvm_sequencer #(HA_seq_item);
 

  
  `uvm_component_utils(HA_sequencer)
  
  function new(string name="sequencer", uvm_component parent);
    super.new(name,parent);
  endfunction
  
endclass
