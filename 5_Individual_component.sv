`include "uvm_macros.svh"
import uvm_pkg::*;

/////////////////////////////////////////////////////////////////////////////
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


///////////////////////////////////////////////////////////////////////////
//  Class: env
//
class env extends uvm_env;
    `uvm_component_utils(env);


    //  Constructor: new
    function new(string name = "env", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    task run();
        `uvm_info("ENV1", "Execute ENV1 Code", UVM_HIGH)
        `uvm_info("ENV2", "Execute ENV2 Code", UVM_HIGH)
    endtask
    
endclass: env



module tb;
driver drv;
env e;

initial begin
drv =new("DRV",null);
e =new("ENV",null);
e.set_report_verbosity_level(UVM_HIGH);
drv.set_report_verbosity_level(UVM_HIGH);

drv.run();
e.run();

end


endmodule
