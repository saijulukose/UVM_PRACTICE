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


//  Class: monitor
//
class monitor extends uvm_component;
    `uvm_component_utils(monitor);

    //  Constructor: new
    function new(string name = "monitor", uvm_component parent);
        super.new(name, parent);
    endfunction: new


    task run();
        `uvm_info("Monitor", "Execute Monitor Code", UVM_HIGH)
    endtask

    
endclass



///////////////////////////////////////////////////////////////////////////
//  Class: env
//
class env extends uvm_env;
    `uvm_component_utils(env);
    driver drv;
    monitor mon;


    //  Constructor: new
    function new(string name = "env", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    task run();
        drv=new("DRV",this);
        mon=new("MON",this);
        drv.run();
        mon.run();
    endtask
    
endclass: env

module tb;

    env e;
    
    initial begin
   
    e =new("ENV",null);
    e.set_report_verbosity_level_hier(UVM_HIGH);
    e.run();
    
    end
    
    
    endmodule
    