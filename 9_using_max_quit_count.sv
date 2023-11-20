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
        `uvm_error(get_name(), "Real Error 1");
        `uvm_error(get_name(), "Real Error 2");
        `uvm_error(get_name(), "Real Error 3");


    endtask
    
endclass: driver


module tb;
    driver d;
    initial begin
        d =new("DRV",null);
        d.set_report_max_quit_count(3);
        d.run();
    end
endmodule