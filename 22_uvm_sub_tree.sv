`include "uvm_macros.svh"
import uvm_pkg::*;


//  Class: a
//
class a extends uvm_component;
    `uvm_component_utils(a);


//  Constructor: new
    function new(string name = "a", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    virtual function void build_phase(uvm_phase phase);
        /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
        /*  For more information see UVM Cookbook v1800.2 p.503  */
    super.build_phase(phase);
    `uvm_info(get_name(), "Build phase of a executed", UVM_NONE)        
    endfunction: build_phase
    
endclass: a



//  Class: a
//
class b extends uvm_component;
    `uvm_component_utils(b);


//  Constructor: new
    function new(string name = "b", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    virtual function void build_phase(uvm_phase phase);
        /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
        /*  For more information see UVM Cookbook v1800.2 p.503  */
    super.build_phase(phase);
    `uvm_info(get_name(), "Build phase of b executed", UVM_NONE)        
    endfunction: build_phase
    
endclass: b



//  Class: c
//
class c extends uvm_component;
    `uvm_component_utils(c);
a a_inst;
b b_inst;

    //  Constructor: new
    function new(string name = "c", uvm_component parent);
        super.new(name, parent);
           endfunction: new


    virtual function void build_phase(uvm_phase phase);
        /*  note: Do not call super.build_phase() from any class that is extended from an UVM base class!  */
        /*  For more information see UVM Cookbook v1800.2 p.503  */
    super.build_phase(phase);
    a_inst=a::type_id::create("a_inst",this);
    b_inst=b::type_id::create("b_inst",this);
    `uvm_info(get_name(), "Build phase of c executed", UVM_NONE)        
    endfunction: build_phase
    

function void end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    uvm_top.print_topology();
endfunction: end_of_elaboration_phase


endclass: c



module tb;
 initial begin
   run_test("c");
 end
endmodule