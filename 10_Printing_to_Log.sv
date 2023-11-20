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
    int file;
    initial begin
        file =$fopen("log.txt","w");
        d =new("DRV",null);
        d.set_report_default_file(file);
        d.set_report_severity_action(UVM_INFO,UVM_DISPLAY|UVM_LOG);
        d.set_report_severity_action(UVM_WARNING,UVM_DISPLAY|UVM_LOG);
        d.set_report_severity_action(UVM_ERROR,UVM_DISPLAY|UVM_LOG);
        d.run();
    end
endmodule