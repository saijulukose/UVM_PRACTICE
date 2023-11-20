//  Class: 19_uvm_obj
//

`include "uvm_macros.svh"
import uvm_pkg::*;

class obj extends uvm_object;
    `uvm_object_utils(obj);

    //  Group: Variables
rand bit [3:0] a;

    //  Group: Constraints


    //  Group: Functions

    //  Constructor: new
    function new(string name = "obj");
        super.new(name);
    endfunction: new
    
endclass: obj



//  Module: tb
//
module tb();
  obj o;
   initial begin
    o = new("obj");
    o.randomize();
    `uvm_info("tb", $sformatf("Value of a : %0d",o.a ), UVM_NONE);
    

   end
    
endmodule: tb
