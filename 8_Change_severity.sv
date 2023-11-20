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
        `uvm_fatal("DRV", "Simulation cannot continue DRV");
        `uvm_fatal("DRV1", "Simulation cannot continue DRV1");
    endtask
    
endclass: driver


module tb;
    driver d;
    initial begin
        d =new("DRV",null);
        //d.set_report_severity_override(UVM_FATAL,UVM_ERROR);
        d.set_report_severity_id_override(UVM_FATAL,"DRV",UVM_ERROR);
        d.run();
    end
endmodule