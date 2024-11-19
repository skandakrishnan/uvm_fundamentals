// log of reports
// log will appear in log.txt
/*
function void set_report_default_file (UVM_FILE file)

only a particular severity report will be written into this file
function void set_report_severity_file (uvm_severity severity,
UVM_FILE file )
*/



`include "uvm_macros.svh"  /// contains uvm_info
import uvm_pkg::*;        ///  contains definition of class: use them to extend our class

class driver extends uvm_driver;
  `uvm_component_utils(driver)   // register class to factory
  
  function new (string path, uvm_component parent);
    super.new(path,parent);
  endfunction
  
  
  task run();
    `uvm_info("DRV", "Informatinal Message", UVM_NONE);
    #10;
    `uvm_warning("DRV", "Potential ERROR");
    #10;
    `uvm_error("DRV", "REAL ERROR");  /// uvm_count
    #10;
    `uvm_error("DRV", "SECOND REAL ERROR");
   // `uvm_fatal("DRV1", "SIMUlATION Cannot CONTINUE DRV1");  //// uvm_exit
   // #10;
   // `uvm_fatal("DRV2", "SIMUlATION Cannot CONTINUE DRV2");
    
  endtask
endclass



  





module tb;

  driver drv;
  int file;
  initial begin
    file = $fopen("log.txt", "w");
    
    drv = new("DRV", null);
    
    // all reports will be written into the same file
    
    drv.set_report_default_file(file);
    
    /*
    
    function void set_report_severity_file (uvm_severity severity,
                                            UVM_FILE file )
                                            
    drv.set_report_severity_file( UVM_ERROR, file);
    drv.set_report_severity_action(UVM_ERROR, UVM_DISPLAY|UVM_LOG);
    
    */
    
    // change the action so everything goes into the log
    drv.set_report_severity_action(UVM_INFO, UVM_DISPLAY|UVM_LOG);
    drv.set_report_severity_action(UVM_WARNING, UVM_DISPLAY|UVM_LOG);
    drv.set_report_severity_action(UVM_ERROR, UVM_DISPLAY|UVM_LOG);
    
    drv.run();
    #10;
    
    $fclose(file);
    
    // select download files after run to see the log
    
     
    
  end
endmodule

