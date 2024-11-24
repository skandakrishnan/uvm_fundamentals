
// changing the verbosity of an object demonstrated using the environment class




`include "uvm_macros.svh"  /// contains uvm_info
import uvm_pkg::*;        ///  contains definition of class: use them to extend our class

class driver extends uvm_driver;
  `uvm_component_utils(driver)   // register class to factory
  
  function new (string path, uvm_component parent);
    super.new(path,parent);
  endfunction
  
  
  task run();
    `uvm_info("DRV1", "Executed Driver1 Code", UVM_HIGH);
    `uvm_info("DRV2", "Executed Driver2 Code", UVM_HIGH);
  endtask
endclass



class environment extends uvm_env;
  `uvm_component_utils(environment)
  
  function new (string path, uvm_component parent);
    super.new(path, parent);
  endfunction
  
  
  task run();
    `uvm_info("ENV1", "Executed ENV1 Code", UVM_HIGH);
    `uvm_info("ENV2", "Executed ENV2 Code", UVM_HIGH);
  endtask
endclass
  

  





module tb;
  
  driver drv;
  environment env;
  initial begin
    
    drv = new("DRV", null);
    env = new("ENV", null);
    //change verbosity for a specific ID
    #10;
    drv.set_report_id_verbosity( "DRV1", UVM_HIGH);
    env.run();
    //expected to see nothing from environement
    drv.run();
    //expected to see only DRV1 uvminfo on the console
    
    #10;
    //change the verbosity of the whole object of the class
    env.set_report_verbosity_level(UVM_HIGH);
    //expected to see both the prints from environment
    env.run();
    //change verbosity for a specific ID
    drv.set_report_id_verbosity( "DRV2", UVM_HIGH);
    drv.run();
    
    // can also change verbosity at command line by 
    // add this in run options with +access+r
    // + UVM_VERBOSITY = UVM_HIGH 
    
  end
endmodule

