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




class second extends uvm_object;

    //  Group: Variables
      rand first f;

    //  Group: Constraints


    //  Group: Functions

    //  Constructor: new
    function new(string name = "second");
        super.new(name);
        f=new("first");
    endfunction: new
    `uvm_object_utils_begin(second)
     `uvm_field_object(f,UVM_DEFAULT);
    `uvm_object_utils_end

endclass: second


module tb;

    second s1,s2;
    //Shallow copy
   /*   initial begin
        s1=new("s1");
        s2=new("s2");
        s1.randomize();
        s1.print();
        s2=s1;
        s2.print();
        s2.f.data=9;
        s1.print();
        s2.print();
    end
*/

//Deep Copy
initial begin
    s1=new("s1");
    s2=new("s2");
    s1.f.randomize();
    s1.print();
    s2.copy(s1);
    s2.print();
    s2.f.data='d7;
    s1.print();
    s2.print();
end


//Clone method
initial begin
    s1=new("s1");
    
    s1.f.randomize();
    s1.print();
    $cast(s2,s1.clone());
    s2.print();
    s2.f.data='d7;
    s1.print();
    s2.print();
end
endmodule