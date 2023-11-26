`include "uvm_macros.svh"
import uvm_pkg::*;

module adder(
    input[3:0]a,b,
    output[4:0] y
);


assign y = a+b;

endmodule


interface adder_if;

    logic [3:0] a;
    logic [3:0] b;
    logic [4:0] y;

endinterface



class drv extends uvm_driver;
    `uvm_component_utils(drv);

    virtual adder_if aif;

    //  Constructor: new
    function new(string name = "drv", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);

        if(!uvm_config_db#(virtual adder_if)::get(this,"", "aif", aif))
            `uvm_error(get_name(), "Unable to find aif")
            
    endfunction


    virtual task run_phase(uvm_phase phase);
        phase.raise_objection(this);
        for(int i=0;i<10;i++)
            begin
                aif.a <= $urandom;
                aif.b <= $urandom;
                #10;
            end
        phase.drop_objection(this);
    endtask
endclass

    
class agent extends uvm_agent;
    `uvm_component_utils(agent);
     drv d;

     //  Constructor: new
    function new(string name = "agent", uvm_component parent);
        super.new(name, parent);
    endfunction: new
    
    virtual function void build_phase(uvm_phase phase);
        super.build_phase(phase);
        d=drv::type_id::create("drv",this);
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
      a=agent::type_id::create("agent",this);
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
      e=env::type_id::create("env",this);
    endfunction
endclass


module tb;

    adder_if aif();

    adder dut(.a(aif.a),
              .b(aif.b),
              .y(aif.y)
              );

    initial begin

        uvm_config_db#(virtual adder_if)::set(null,"uvm_test_top.env.agent.drv","aif",aif);
        run_test("my_test");
        #100;
    end
   

endmodule 
