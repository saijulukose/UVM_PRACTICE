`include "uvm_macros.svh"
import uvm_pkg::*;


module tb;
    
    initial begin
        `uvm_info("A12", $sformatf("Default Verbosity Level %d",uvm_top.get_report_verbosity_level), UVM_NONE)        
        `uvm_info("A12", "Some Print for UVM_NONE", UVM_NONE)
        `uvm_info("A12", "Some Print for UVM_LOW", UVM_LOW)
        `uvm_info("A12", "Some Print for UVM_MEDIUM", UVM_MEDIUM)
        `uvm_info("A12", "Some Print for UVM_HIGH", UVM_HIGH)
        `uvm_info("A12", "Some Print for UVM_FULL", UVM_FULL)
        `uvm_info("A12", "Some Print for UVM_DEBUG", UVM_DEBUG)

        #100;
         uvm_top.set_report_verbosity_level(500);
        `uvm_info("A12", $sformatf("Updated Verbosity Level %d",uvm_top.get_report_verbosity_level), UVM_NONE)
        `uvm_info("A12", "Some Print for UVM_NONE", UVM_NONE)
        `uvm_info("A12", "Some Print for UVM_LOW", UVM_LOW)
        `uvm_info("A12", "Some Print for UVM_MEDIUM", UVM_MEDIUM)
        `uvm_info("A12", "Some Print for UVM_HIGH", UVM_HIGH)
        `uvm_info("A12", "Some Print for UVM_FULL", UVM_FULL)
        `uvm_info("A12", "Some Print for UVM_DEBUG", UVM_DEBUG)
    end
endmodule