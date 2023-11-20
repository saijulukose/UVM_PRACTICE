`include "uvm_macros.svh"
import uvm_pkg::*;

module tb(
);
    initial begin
    #50;
        `uvm_info("tb_top","Hello World",UVM_LOW);
        $display("Hello World With Display");
        `uvm_info("TB_TOP","string",UVM_LOW);
    end    
endmodule