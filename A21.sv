//  Class: my_object
//

`include "uvm_macros.svh"
import uvm_pkg::*;

class my_object extends uvm_object;
    

    // Variables
    rand logic[1:0] a;
    rand logic[3:0] b;
    rand logic[7:0] c;
    
`uvm_object_utils_begin(my_object);
    `uvm_field_int(a,UVM_DEFAULT);
    `uvm_field_int(b,UVM_DEFAULT);
    `uvm_field_int(c,UVM_DEFAULT);
`uvm_object_utils_end

    //  Constructor: new
    function new(string name = "my_object");
        super.new(name);
    endfunction: new
    
endclass: my_object


module tb();

my_object obj;

    initial begin
        obj=my_object::type_id::create("obj");
        obj.randomize();
        obj.print();
    end

endmodule