`include "uvm_macros.svh"
import uvm_pkg::*;

//  Class: comp
//
class comp extends uvm_component;
    `uvm_component_utils(comp);

    //  Constructor: new
    function new(string name = "comp", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    virtual function void build_phase(uvm_phase phase);
        /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
        /*  For more information see UVM Cookbook v1800.2 p.503  */
        super.build_phase(phase);
        `uvm_info(get_name(), "Build phase of comp executed......", UVM_NONE);
    endfunction: build_phase
    

    
endclass: comp



module tb;

    initial begin 
        run_test("comp");
    end

endmodule