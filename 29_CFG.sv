
`include "uvm_macros.svh"
import uvm_pkg::*;

//  Class: comp1
//
class comp1 extends uvm_component;
    `uvm_component_utils(comp1);

    int data1=0;

    //  Constructor: new
    function new(string name = "comp1", uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(int)::get(null,"uvm_test_top", "data", data1))
            `uvm_error(get_name(), "message")
            
    endfunction
    
    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(get_name(),$sformatf("Data Received %0d",data1), UVM_NONE)
        phase.drop_objection(this);
    endtask
endclass: comp1


//  Class: comp2
//
class comp2 extends uvm_component;
    `uvm_component_utils(comp2);

    int data2=0;

    //  Constructor: new
    function new(string name = "comp2", uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        if(!uvm_config_db#(int)::get(null,"uvm_test_top", "data", data2))
            `uvm_error(get_name(), "message")
            
    endfunction
    
    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(get_name(),$sformatf("Data Received %0d",data2), UVM_NONE)
        phase.drop_objection(this);
    endtask
endclass: comp2




class agent extends uvm_agent;
    `uvm_component_utils(agent);
    comp1 c1;
    comp2 c2;

     //  Constructor: new
    function new(string name = "agent", uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        c1=comp1::type_id::create("comp1",this);
        c2=comp2::type_id::create("comp2",this);
    endfunction



endclass




class env extends uvm_env;
    `uvm_component_utils(env);
    agent a;

     //  Constructor: new
    function new(string name = "env", uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
      a=agent::type_id::create("a",this);
    endfunction


endclass


class my_test extends uvm_test;
    `uvm_component_utils(my_test);
    env e;

     //  Constructor: new
    function new(string name = "my_test", uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
      e=env::type_id::create("e",this);
    endfunction


endclass


module tb();

    int data =256;

initial begin
    uvm_config_db#(int)::set(null,"uvm_test_top","data",data);
    
    run_test("my_test");
end
endmodule 