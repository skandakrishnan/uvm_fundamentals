*/

`include "uvm_macros.svh"  /// contains uvm_info
import uvm_pkg::*;        ///  contains definition of class: use them to extend our class







module tb;
  int data = 56;
  initial begin
    
    `uvm_info("TB_TOP", $sformatf("value:%0d", data) , UVM_NONE);
    
    $display ("Value : %0d", data);
    
  end
endmodule
