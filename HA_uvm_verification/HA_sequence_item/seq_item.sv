class HA_seq_item extends uvm_sequence_item;
  `uvm_object_utils(HA_seq_item)     //Utility
  rand bit [3:0]a;
  rand bit [3:0]b;
  bit [3:0]sum;
  bit carry;
  

  
  //Constructor
  
  function new (string name="HA_seq_item");
    super.new(name);
  endfunction
  
endclass
