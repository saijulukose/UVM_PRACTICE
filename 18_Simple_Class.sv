//  Class: 18_Simple_Class
//
class Simple_Class;
    //  Group: Variables
 rand bit[3:0] data;

endclass


//  Module: tb
//
module tb();
Simple_Class f;
initial begin
    f=new();
    f.randomize();
    $display("Value of data = %0d",f.data);
end
    
endmodule
