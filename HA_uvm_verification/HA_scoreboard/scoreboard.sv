

class HA_scoreboard extends uvm_scoreboard;
  
  
  `uvm_component_utils(HA_scoreboard)
  
  uvm_analysis_imp #(HA_seq_item,HA_scoreboard) sb_imp;
  
  function new(string name="scoreboard", uvm_component parent);
    super.new(name,parent);
    
  endfunction
  
  function void build_phase (uvm_phase phase);
    super.build_phase(phase);
    sb_imp=new("sb_imp",this);
  endfunction
  
  function void write(HA_seq_item item);
    bit [3:0]exp_sum;
    bit exp_carry;
    bit [4:0]exp;
    
    exp=item.a+item.b;
    
    {exp_sum,exp_carry}={exp[3:0],exp[4]};
    
    
    if(exp_sum==item.sum && exp_carry==item.carry)
      `uvm_info("SB",$sformatf("PASS----> INPUT:a=%d |b=%d|Actual output: sum=%d |carry=%0b || Expected output:sum=%d |carry=%0b",item.a,item.b,item.sum,item.carry,exp_sum,exp_carry),UVM_LOW)
    else
      `uvm_error("SB",$sformatf("FAIL----> INPUT:a=%d |b=%d|Actual output: sum=%d |carry=%0b || Expected output:sum=%d |carry=%0b",item.a,item.b,item.sum,item.carry,exp_sum,exp_carry))
  endfunction
  
endclass
  
  
  
  
  
  
  
