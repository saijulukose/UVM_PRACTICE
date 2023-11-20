//  Class: driver

`include "uvm_macros.svh"
import uvm_pkg::*;

class driver extends uvm_component;
    `uvm_component_utils(driver);

    function new(string name = "driver", uvm_component parent);
        super.new(name, parent);
    endfunction: new


    task run();
        `uvm_info(get_name(), "Informational message", UVM_NONE);
        `uvm_warning(get_name(), "Potential Error");
        `uvm_error(get_name(), "Real Error");
        #10;
        `uvm_fatal(get_name(), "Simulation cannot continue");
        
    endtask
    
endclass: driver


module tb;
    driver d;
    initial begin
        d =new("DRV",null);
        d.run();
    end
endmodule