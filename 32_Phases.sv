`include "uvm_macros.svh"
import uvm_pkg::*;

//  Class: phases_understanding
//
class phases_understanding extends uvm_component;
    `uvm_component_utils(phases_understanding);

    //  Group: Configuration Object(s)


    //  Group: Components


    //  Group: Variables


    //  Group: Functions

    //  Constructor: new
    function new(string name = "phases_understanding", uvm_component parent);
        super.new(name, parent);
    endfunction: new

    /*---  UVM Build Phases            ---*/
    /*------------------------------------*/
    //  Function: build_phase
    extern function void build_phase(uvm_phase phase);
    //  Function: connect_phase
    extern function void connect_phase(uvm_phase phase);
    //  Function: end_of_elaboration_phase
    extern function void end_of_elaboration_phase(uvm_phase phase);

    /*---  UVM Run Phases              ---*/
    /*------------------------------------*/
    //  Function: start_of_simulation_phase
    extern function void start_of_simulation_phase(uvm_phase phase);
    //  Function: reset_phase
    extern task reset_phase(uvm_phase phase);
    //  Function: configure_phase
    extern task configure_phase(uvm_phase phase);
    //  Function: main_phase
    extern task main_phase(uvm_phase phase);
    //  Function: shutdown_phase
    extern task shutdown_phase(uvm_phase phase);

    /*---  UVM Cleanup Phases          ---*/
    /*------------------------------------*/
    //  Function: extract_phase
    extern function void extract_phase(uvm_phase phase);
    //  Function: report_phase
    extern function void report_phase(uvm_phase phase);
    
endclass: phases_understanding


/*----------------------------------------------------------------------------*/
/*  UVM Build Phases                                                          */
/*----------------------------------------------------------------------------*/
function void phases_understanding::build_phase(uvm_phase phase);
    super.build_phase(phase);
    `uvm_info(get_name(), "Inside Buid Phase.....", UVM_NONE)
    
endfunction: build_phase


function void phases_understanding::connect_phase(uvm_phase phase);
    super.connect_phase(phase);
    `uvm_info(get_name(), "Inside connect Phase.....", UVM_NONE)

endfunction: connect_phase


function void phases_understanding::end_of_elaboration_phase(uvm_phase phase);
    super.end_of_elaboration_phase(phase);
    `uvm_info(get_name(), "Inside end_of_elaboration_phase phase.....", UVM_NONE)
    uvm_top.print_topology();
endfunction: end_of_elaboration_phase


/*----------------------------------------------------------------------------*/
/*  UVM Run Phases                                                            */
/*----------------------------------------------------------------------------*/
function void phases_understanding::start_of_simulation_phase(uvm_phase phase);
    super.start_of_simulation_phase(phase);
    `uvm_info(get_name(), "Inside start_of_simulation_phase.....", UVM_NONE)
endfunction: start_of_simulation_phase


task phases_understanding::reset_phase(uvm_phase phase);
    `uvm_info(get_name(), "Inside end_of_elaboration_phase phase.....", UVM_NONE)
endtask: reset_phase


task phases_understanding::configure_phase(uvm_phase phase);
    `uvm_info(get_name(), "Inside configure phase.....", UVM_NONE)
endtask: configure_phase


task phases_understanding::main_phase(uvm_phase phase);
phase.raise_objection(this);
    #100;
    `uvm_info(get_name(), "Inside main phase.....", UVM_NONE)
    phase.drop_objection(this);

endtask: main_phase


task phases_understanding::shutdown_phase(uvm_phase phase);
phase.raise_objection(this);

    #10;
    `uvm_info(get_name(), "Inside shutdown phase.....", UVM_NONE)
    phase.drop_objection(this);
   
    
endtask: shutdown_phase


/*----------------------------------------------------------------------------*/
/*  UVM Cleanup Phases                                                        */
/*----------------------------------------------------------------------------*/
function void phases_understanding::report_phase(uvm_phase phase);
    super.report_phase(phase);
endfunction: report_phase


function void phases_understanding::extract_phase(uvm_phase phase);
    super.extract_phase(phase);
endfunction: extract_phase


module tb();

    initial begin
        run_test("phases_understanding");
    end
endmodule