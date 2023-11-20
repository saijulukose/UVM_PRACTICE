//  Class: Copy_Clone
//
class Copy_Clone extends uvm_object;

    //  Group: Variables
        rand bit[3:0] data;

    //  Group: Constraints


    //  Group: Functions

    //  Constructor: new
    function new(string name = "Copy_Clone");
        super.new(name);
    endfunction: new
    `uvm_object_utils_begin(Copy_Clone)
     `uvm_field_int(data,UVM_DEFAULT);
    `uvm_object_utils_end

endclass: Copy_Clone


module tb;

    Copy_Clone f;
    Copy_Clone s;

    initial begin
        f=new("first");
        s=new("second");
        f.randomize();
        s.copy(f);
        f.print();
        s.print();

        #10;

    end
    
endmodule