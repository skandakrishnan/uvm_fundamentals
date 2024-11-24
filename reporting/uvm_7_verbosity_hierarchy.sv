





`include "uvm_macros.svh"  /// contains uvm_info
import uvm_pkg::*;        ///  contains definition of class: use them to extend our class

class driver extends uvm_driver;
  `uvm_component_utils(driver)   // register class to factory
  
  function new (string path, uvm_component parent);
    super.new(path,parent);
  endfunction
  
  
  task run();
    `uvm_info("DRV", "Executed Driver Code", UVM_HIGH);
  endtask
endclass


class monitor extends uvm_monitor;
  `uvm_component_utils(monitor)   // register class to factory
  
  function new (string path, uvm_component parent);
    super.new(path,parent);
  endfunction
  
  
  task run();
    `uvm_info("MON", "Executed Monitor Code", UVM_HIGH);
  endtask
endclass


class environment extends uvm_env;
  `uvm_component_utils(environment)
  
  driver drv;
  monitor mon;
  
  function new (string path, uvm_component parent);
    super.new(path, parent);

  endfunction
  
  
  task run();
    drv = new("DRV", this);
    mon = new("MON", this);
    drv.run();
    mon.run();  
  endtask
endclass
  

  





module tb;

  environment env1,env2;
  initial begin
    env1 = new("ENV1", null);
    
    // nothing should be printed
    env1.run();
    
    env2 = new("ENV2", null);
    
    //change verbosity for a whole hierarchy
    // all components in env should have virbosity of UVM_HIGH
    #10;
    env2.set_report_verbosity_level_hier(UVM_HIGH);
    env2.run();
  end
endmodule

