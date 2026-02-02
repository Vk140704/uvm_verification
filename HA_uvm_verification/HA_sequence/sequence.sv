

class HA_sequence extends uvm_sequence #(HA_seq_item);
  
  //utility
  
  `uvm_object_utils(HA_sequence)
  
  //constructor
  
  function new(string name="HA_sequence");
    super.new(name);
  endfunction
  
  task body();
    HA_seq_item req;
    
    `uvm_info("SEQ", "Sequence starts", UVM_LOW)
    
    repeat(10)
      begin
        
        req=HA_seq_item::type_id::create("req");
        `uvm_do(req)
      end
  endtask
      
endclass
