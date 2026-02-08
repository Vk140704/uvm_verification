class fifo_sequence extends uvm_sequence#(fifo_seq_item);
  
  `uvm_object_utils(fifo_sequence)
  
  function new(string name="sequence");
    super.new(name);
  endfunction
  
  task body();
    fifo_seq_item req;
    
    `uvm_info("SEQ","Sequence starts",UVM_LOW)
    
    repeat(20) begin
      req=fifo_seq_item#()::type_id::create("req");
    
    `uvm_do(req);
    end
  endtask
endclass
    
  
