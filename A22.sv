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

my_object obj1,obj2;
int status;

    initial begin
        obj1=my_object::type_id::create("obj1");
        obj1.randomize();
        obj1.print();
        $cast(obj2,obj1.clone());
        obj2.print();
        status=obj2.compare(obj1);
        `uvm_info("tb",$sformatf("Status of comparison is %0d",status ), UVM_NONE);
    end

endmodule