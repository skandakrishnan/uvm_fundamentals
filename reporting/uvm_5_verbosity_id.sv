





`include "uvm_macros.svh"  /// contains uvm_info
import uvm_pkg::*;        ///  contains definition of class: use them to extend our class

class driver extends uvm_driver;
  `uvm_component_utils(driver)
  
  function new (string path, uvm_component parent);
    super.new(path,parent);
  endfunction
  
  
  task run();
    `uvm_info("DRV1", "Executed Driver1 Code", UVM_HIGH);
    `uvm_info("DRV2", "Executed Driver2 Code", UVM_HIGH);
  endtask
endclass

/*

class env extends uvm_env;
  `uvm_component_utils(env)
  
  function new (string path, uvm_component parent);
    super.new(path, parent);
  endfunction
  
  
  task run();
    `uvm
  
*/  
  





module tb;
  
  driver drv;
  initial begin
    
    drv = new("DRV", null);
    
    //change verbosity for a specific ID
    #10;
    drv.set_report_id_verbosity( "DRV1", UVM_HIGH);
    
    drv.run();
    //expected to see only DRV1 uvminfo on the console
    
    #10;
    drv.set_report_id_verbosity( "DRV2", UVM_HIGH);
    drv.run();
    
    
  end
endmodule

