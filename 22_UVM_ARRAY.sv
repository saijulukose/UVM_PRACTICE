//  Class: 22_UVM_ARRAY
//
`include "uvm_macros.svh"
import uvm_pkg::*;

class UVM_ARRAY extends uvm_object;
  

    //  Group: Variables
      //Static Array
       int arr1[3]={1,2,3};
       //Dynamic Array
       int arr2[];
       //Queue
       int arr3[$];
       //Associative Array
       int arr4[int];
    //  Group: Constraints


    //  Group: Functions

    //  Constructor: new
    function new(string name = "UVM_ARRAY");
        super.new(name);
    endfunction: new


    `uvm_object_utils_begin(UVM_ARRAY)
        `uvm_field_sarray_int(arr1,UVM_DEFAULT);
        `uvm_field_array_int(arr2,UVM_DEFAULT);
        `uvm_field_queue_int(arr3,UVM_DEFAULT);
        `uvm_field_aa_int_int(arr4,UVM_DEFAULT);
    `uvm_object_utils_end

task run();
    //Static array
    arr2=new[3];
    arr2[0]=2;
    arr2[1]=2;
    arr2[2]=2;

    //Queue
    arr3.push_front(3);
    arr3.push_front(3);

    //Associative arrays
    arr4[1]=4;
    arr4[2]=4;
    arr4[3]=4;
    arr4[4]=4;
    


endtask
    
endclass: UVM_ARRAY


module tb;
UVM_ARRAY a;

initial begin
    a=new("UVM_ARRAY");
    a.run();
    a.print();
end
endmodule
