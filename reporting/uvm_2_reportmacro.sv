

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




*/

`include "uvm_macros.svh"  /// contains uvm_info
import uvm_pkg::*;        ///  contains definition of class: use them to extend our class







module tb;
  initial begin
    /*
    The line number of the message and the file and time at which the message is being sent is also shown. 
    */
    //# KERNEL: UVM_INFO /home/runner/testbench.sv(66) @ 0: reporter [TB_TOP] Hello World
    `uvm_info("TB_TOP", "Hello World", UVM_LOW);
    
    $display ("Hello World with Display");
    
  end
endmodule