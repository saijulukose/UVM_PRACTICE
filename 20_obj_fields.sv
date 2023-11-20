`include "uvm_macros.svh"
import uvm_pkg::*;


class obj_fields extends uvm_object;
  //  `uvm_object_utils(obj_fields);
`uvm_object_utils_begin(obj_fields)
  `uvm_field_int(a,UVM_DEFAULT)
`uvm_object_utils_end
    //  Group: Variables
rand bit [3:0] a;

    //  Group: Constraints


    //  Group: Functions

    //  Constructor: new
    function new(string name = "obj_fields");
        super.new(name);
    endfunction: new
    
endclass



//  Module: tb
//
module tb();
  obj_fields o;
   initial begin
    o = new("obj_fields");
    o.randomize();
    //`uvm_info("tb", $sformatf("Value of a : %0d",o.a ), UVM_NONE);
    o.print();

   end
    
endmodule: tb
