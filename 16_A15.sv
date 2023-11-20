`include "uvm_macros.svh"
import uvm_pkg::*;

module tb;
        
        initial begin
            `uvm_info("TB", "Here begins the simulation", UVM_NONE)
            #20;
            uvm_top.set_report_severity_override(UVM_WARNING,UVM_FATAL);
            `uvm_warning("TB", "This a warning and has been overriden as fatal ,causing simulation to stop....")
        end    
    endmodule