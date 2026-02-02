
class HA_driver extends uvm_driver #(HA_seq_item);

  
  //Factorization 
  `uvm_component_utils(HA_driver)
  HA_seq_item req;
  
  virtual HA_if vif;//Handle to interface used to drive dut pins

  function new(string name="driver",uvm_component parent);
    super.new(name,parent);
  endfunction
  
  function void build_phase(uvm_phase phase);
    
    super.build_phase(phase);
     if(!uvm_config_db #(virtual HA_if)::get(this,"","vif",vif))
      `uvm_fatal("DRIVER","Virtual interface not found")
  endfunction
  
  task run_phase(uvm_phase phase);
    
    super.run_phase(phase);
    
    forever begin
      req=HA_seq_item::type_id::create("req");
      
      seq_item_port.get_next_item(req);
      vif.a=req.a;
      vif.b=req.b;
      
      #10;
      
      seq_item_port.item_done();
    end
  endtask
endclass
  
