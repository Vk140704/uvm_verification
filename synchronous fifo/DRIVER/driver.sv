class fifo_driver  extends uvm_driver#(fifo_seq_item);
  
  `uvm_component_utils(fifo_driver)
  
  fifo_seq_item req;
  virtual fifo_inf vif;
  
  function new(string name="Driver",uvm_component parent);
    
    super.new(name,parent);
    
  endfunction
  
  function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    if(!(uvm_config_db #(virtual fifo_inf)::get(this,"","vif",vif)))
       `uvm_fatal("DRIVER","virtual interace not found")
       endfunction
      
       
  task run_phase(uvm_phase phase);
    super.run_phase(phase);
      @(posedge vif.rstn);

    
    forever begin
      req=fifo_seq_item#()::type_id::create("req");
    
    seq_item_port.get_next_item(req);
    
    
    @(negedge vif.clk);
    
    //vif.rstn<=req.rstn;
    vif.wr_en <=req.wr_en;
    vif.rd_en <= req.rd_en;
    vif.data_in <=req.data_in;
    
    @(posedge vif.clk);
    #10;
    //@(negedge vif.clk);
   vif.wr_en  <= 0;
   vif.rd_en  <= 0;
    seq_item_port.item_done();
    end
  endtask
endclass
