`include "uvm_macros.svh"
import uvm_pkg::*;

module tb;
        
        initial begin
         //Before overriding 
            `uvm_warning("tb", "Warning message 1");
            `uvm_warning("tb", "Warning message 2");
            `uvm_warning("tb", "Warning message 3");
            `uvm_warning("tb", "Warning message 4");
            `uvm_warning("tb", "Warning message 5");
            `uvm_warning("tb", "Warning message 6");
        #50;
        //After updating report severity action and seting max error count
        uvm_top.set_report_severity_action(UVM_WARNING,UVM_DISPLAY |UVM_COUNT);
        uvm_top.set_report_max_quit_count(4);
        `uvm_warning("tb", "Warning message 1");
        `uvm_warning("tb", "Warning message 2");
        `uvm_warning("tb", "Warning message 3");
        `uvm_warning("tb", "Warning message 4");
        `uvm_warning("tb", "Warning message 5");
        `uvm_warning("tb", "Warning message 6");

        end    
    endmodule