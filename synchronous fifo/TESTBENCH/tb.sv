import uvm_pkg::*;          
`include "uvm_macros.svh"

`include "interface.sv"
`include "seq_item.sv"
`include "sequence.sv"
`include "sequencer.sv"
`include "driver.sv"
`include "monitor.sv"
`include "agent.sv"
`include "scoreboard.sv"
`include "environment.sv"
`include "test.sv"

  
module top#(parameter DATA_WIDTH=8,DEPTH=8);
  
  fifo_inf #(DATA_WIDTH,DEPTH)vif();
  
  sync_fifo dut(.clk(vif.clk),
          .rstn(vif.rstn),
          .wr_en(vif.wr_en),
          .rd_en(vif.rd_en),
          .data_in(vif.data_in),
          .data_out(vif.data_out),
          .full(vif.full),
          .empty(vif.empty)
        );
  
  initial begin
    
    uvm_config_db#(virtual fifo_inf)::set(null,"*","vif",vif);
    
    run_test ("fifo_test");
  end
  always #5 vif.clk=~vif.clk;
  
  initial begin
    
    $dumpfile("fifo_UVM.vcd");
    $dumpvars;
    vif.clk=0;
    
    vif.rstn=0;
    #50;
    vif.rstn=1;
    
    
    #500;
    
    $finish;
    
  end
endmodule
