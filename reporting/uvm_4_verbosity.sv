

/*

Defines all possible values for report severity

UVM_INFO: Informative message (ID, MSG, redundancy level) 
  redundancy level : default = 200 : UVM_MEDIUM 
  any info below the default is printed
  uvm_verbosity : 
  UVM_NONE - report is always printed. verbosity level cannot disable it
  UVM_LOW - report is issued is configured verbosity is set to UVM_LOW or above
  UVM_MEDIUM -report is issued is configured verbosity is set to UVM_MEDIUM or above
  UVM_HIGH - report is issued is configured verbosity is set to UVM_HIGH or above
  UVM_FULL - report is issued is configured verbosity is set to UVM_FULL or above
  
  
UVM_WARNING(ID, MSG) - Indicates a potential problem 

UVM_ERROR(ID, MSG) - Indicates a real problem. Simulation continues subject to the configured message action 

UVM_FATAL(ID, MSG) - Indicates a problem from which simulation cannot recover. 
                     Simulation exits via $finish after a #0 delay
            

typedef enum bit [1:0]
{
  UVM_INFO,
  UVM_WARNING,
  UVM_ERROR,
  UVM_FATAL
} uvm_severity;



typedef enum
{
  UVM_NONE   = 0,
  UVM_LOW    = 100,
  UVM_MEDIUM = 200,
  UVM_HIGH   = 300,
  UVM_FULL   = 400,
  UVM_DEBUG  = 500
} uvm_verbosity;


UVM_ROOT is parent to all the class that we add in UVM Testbench Environment(UVM Tree)

Because UVM_ROOT Returns a null pointer, we cannot directly access it. However in a few situations, we may need to access or configure the default settings of UVM_ROTT.

In such a case,UVM provides a global variable UVM_TOP whch is accessible to all classes of environment. UVM_TOP could be used whenever we need to work with the UVM Root. 




*/




`include "uvm_macros.svh"  /// contains uvm_info
import uvm_pkg::*;        ///  contains definition of class: use them to extend our class







module tb;
  
  int data = 56;
  initial begin
    
    
    // report the default verbosity 
    //KERNEL: Default Verbosity : 200
    // set at UVM_MEDIUM
    $display ("Default Verbosity : %0d", uvm_top.get_report_verbosity_level);
    #10;
    // with UVM_MEDIUM should be printed, as its equal to configured verbosity
    `uvm_info ("TB_TOP", "String" , UVM_MEDIUM);
    
    // with UVM_HIGH should not be printed, as its greater than configured verbosity
    `uvm_info ("TB_TOP", "String" , UVM_HIGH);
    
    // change configured verbosity to UVM_HIGH and try again
    uvm_top.set_report_verbosity_level(UVM_HIGH);
    //# KERNEL: Current Verbosity : 300
    $display ("Current Verbosity : %0d", uvm_top.get_report_verbosity_level);
    `uvm_info ("TB_TOP", "String" , UVM_HIGH);
    
    
    
    
  end
endmodule

