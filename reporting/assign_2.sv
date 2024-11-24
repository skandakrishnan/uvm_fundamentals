/*

Write a code to change the verbosity of the entire verification environment to UVM_DEBUG. To demonstrate successful configuration, print the value of the verbosity level on the console.
*/




`include "uvm_macros.svh"  /// contains uvm_info
import uvm_pkg::*;        ///  contains definition of class: use them to extend our class
module tb;
  
  int data = 56;
  initial begin
    
    
    // report the default verbosity 
    //KERNEL: Default Verbosity : 200
    // set at UVM_MEDIUM
    
    uvm_top.set_report_verbosity_level(UVM_DEBUG);
    #10;
    `uvm_info ("TB_TOP", "UVM_NONE" , UVM_NONE);
    #10;
    `uvm_info ("TB_TOP", "UVM_LOW" , UVM_LOW);
    #10;
    `uvm_info ("TB_TOP", "UVM_MEDIUM" , UVM_MEDIUM);
    #10;
    `uvm_info ("TB_TOP", "UVM_HIGH" , UVM_HIGH);
    #10;
    `uvm_info ("TB_TOP", "UVM_FULL" , UVM_FULL);
    #10;
    `uvm_info ("TB_TOP", "UVM_DEBUG" , UVM_DEBUG);
    #10;
    
    
    
    `uvm_info ("TB_TOP", $sformatf("Current Verbosity: %0d",uvm_top.get_report_verbosity_level)  , UVM_DEBUG);
    #10;
    
    
    
    
    
  end
endmodule