
`include "uvm_macros.svh"
import uvm_pkg::*;

//  Class: env
//
class env extends uvm_env;
    `uvm_component_utils(env);
int data;
    //  Constructor: new
    function new(string name = "env", uvm_component parent=null);
        super.new(name, parent);
    endfunction: new
    
virtual function void build_phase(uvm_phase phase);
   super.build_phase(phase);

   if(uvm_config_db#(int)::get(null,"my_test", "data", data))
   `uvm_info("env",$sformatf("Data exists :%0d",data ),UVM_NONE)
   else
   `uvm_fatal(get_name(), "Data not foud in cfg database....")
   
   
endfunction
    
endclass: env


class my_test extends uvm_test;
`uvm_component_utils(my_test);

  int data;
  env e;
  
    //  Constructor: new
    function new(string name = "my_test", uvm_component parent);
        super.new(name, parent);
    endfunction: new

  virtual function void build_phase(uvm_phase phase);
    super.build_phase(phase);
    e=env::type_id::create("e",this);
    uvm_config_db#(int)::set(null,"my_test","data", 12);
    
  endfunction


endclass:my_test


module tb();

    initial begin
        run_test("my_test");
    end
endmodule