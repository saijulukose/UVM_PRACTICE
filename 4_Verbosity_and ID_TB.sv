`include "uvm_macros.svh"
import uvm_pkg::*;

//  Class: driver
//
class driver extends uvm_component;
    `uvm_component_utils(driver);

    //  Constructor: new
    function new(string name = "driver", uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    task run();
        `uvm_info("DRV1", "Execute Driver 1 Code", UVM_HIGH)
        `uvm_info("DRV2", "Execute Driver 2 Code", UVM_HIGH)
    endtask
    
endclass: driver




