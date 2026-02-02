import uvm_pkg::*;          
`include "uvm_macros.svh"

`include "interface.sv"
`include "sequence_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

module top;
  
  HA_if vif();
  
  HA dut(.a(vif.a),
         .b(vif.b),
         .sum(vif.sum),
         .carry(vif.carry)
        );
  
  initial begin
    
    uvm_config_db#(virtual HA_if)::set(null,"*","vif",vif);
    
    run_test ("HA_test");
  end
  
  initial begin
    
    $dumpfile("HA_UVM.vcd");
    $dumpvars;
    
    #100;
    
    $finish;
    
  end
endmodule
