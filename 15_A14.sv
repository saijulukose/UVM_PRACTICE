`include "uvm_macros.svh"
import uvm_pkg::*;
 
//////////////////////////////////////////////////
class component extends uvm_component;
  `uvm_component_utils(component)
  
  function new(string path , uvm_component parent);
    super.new(path, parent);
  endfunction
 
  
  task run();
    `uvm_info("CMP1", "Executed CMP1 Code", UVM_DEBUG);
    `uvm_info("CMP2", "Executed CMP2 Code", UVM_DEBUG);
  endtask
  
endclass

module tb;
        
    initial begin
     component c1;
     c1=new("Component1",null);
     c1.set_report_id_verbosity("DRV1",UVM_DEBUG);
     c1.run();
    end    
endmodule