`include "uvm_macros.svh"
import uvm_pkg::*;


module tb;
    initial begin
        $display("Default verbosity level : %0d",uvm_top.get_report_verbosity_level);
        uvm_top.set_report_verbosity_level(UVM_HIGH);
        `uvm_info("TB_TOP","string",UVM_HIGH);
    end

endmodule