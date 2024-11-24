/*

Send the name of the first RTL that you designed in Verilog with the help of reporting Macro. Do not override the default verbosity. Expected Output : "First RTL : Your_System_Name"
*/

`include "uvm_macros.svh"
import uvm_pkg ::*;

module tb;
  string proj = "FIRST_RTL";
  initial begin
    `uvm_info("TB_TOP", $sformatf("First RTL : %0s",proj), UVM_NONE);
  end
endmodule
