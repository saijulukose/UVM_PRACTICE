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

endclass: first



module tb;

first f1,f2;
int status =0 ;
//Clone method
initial begin

repeat(5)
begin
    f1=new("f1");
    f2=new("f2");
    f1.randomize();
    f2.randomize();
    f1.print();
    f2.print();
    
    status =f1.compare(f2);
    $display("Value of status :%0d",status);
end
f2.copy(f1);
status =f1.compare(f2);
 $display("Value of status :%0d",status);
end
endmodule