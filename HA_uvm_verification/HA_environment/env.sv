


class HA_env extends uvm_env;
  
  `uvm_component_utils(HA_env);
  
  HA_agent agent;
  HA_scoreboard sb;
  
  function new(string name="environment", uvm_component parent);
    super.new(name, parent);
    
    `uvm_info("ENV", "Environment Created", UVM_LOW)
    
  endfunction
  
  function void build_phase (uvm_phase phase);
    
    super.build_phase(phase);
    
    agent= HA_agent:: type_id ::create("agent",this);
    
    sb=HA_scoreboard::type_id:: create("sb",this);
    
  endfunction
  
  function void  connect_phase (uvm_phase phase);
    
    super.connect_phase(phase);
    
    agent.montr.mon_ap.connect(sb.sb_imp);
    
  endfunction
  
endclass
