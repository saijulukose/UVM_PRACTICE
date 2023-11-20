`include "uvm_macros.svh"
import uvm_pkg::*;

class first extends uvm_object;

    //  Group: Variables
        rand bit[3:0] data;

    //  Group: Constraints


    //  Group: Functions

    //  Constructor: new
    function new(string name = "first");
        super.new(name);
    endfunction: new
    `uvm_object_utils_begin(first)
     `uvm_field_int(data,UVM_DEFAULT);
    `uvm_object_utils_end

endclass


class first_mod extends uvm_object;

    //  Group: Variables
        rand bit ack;

    //  Group: Constraints


    //  Group: Functions

    //  Constructor: new
    function new(string name = "first_mod");
        super.new(name);
    endfunction: new
    `uvm_object_utils_begin(first_mod)
     `uvm_field_int(ack,UVM_DEFAULT);
    `uvm_object_utils_end

endclass


//  Class: comp
//
class comp extends uvm_component;
    `uvm_component_utils(comp);

    //  Group: Configuration Object(s)

   
    //  Group: Components


    //  Group: Variables
     first f;

    //  Group: Functions

    //  Constructor: new
    function new(string name = "comp", uvm_component parent);
        super.new(name, parent);
        f=first::type_id::create("f");
        f.randomize();
        f.print();
    endfunction: new

    
endclass: comp

module tb;

comp c;
//Clone method
initial begin
c.set_type_override_by_type(first::get_type,first_mod::get_type);
c=comp::type_id::create("c",null);

end
endmodule