`include "uvm_macros.svh"
import uvm_pkg::*;



    interface usb_if#(
        parameter DATA_WIDTH = 8,
        parameter ADDRESS_WIDTH = 16
      );
      
        // USB signals
        logic [DATA_WIDTH-1:0] dplus, dminus, clk_usb;
      
        // AXI interface signals
        logic [ADDRESS_WIDTH-1:0] awaddr, awvalid, awready;
        logic [DATA_WIDTH-1:0] wdata, wstrb, wvalid, wready;
        logic [DATA_WIDTH-1:0] rdata, rvalid, rready;
        logic bvalid, bready;

        task send_data();
            `uvm_info("usb_if", "Send data to usb_if", UVM_NONE)
            
        endtask

        task receive_data();
            `uvm_info("usb_if", "Receive data to usb_if", UVM_NONE)
            
        endtask

      endinterface



      interface i2c_if #(
        parameter DATA_WIDTH = 8,
        parameter ADDRESS_WIDTH = 7
      );
      
        // I2C signals
        logic scl, sda;

        
        task send_data();
            `uvm_info("i2c_if", "Send data to i2c_if", UVM_NONE)
            
        endtask

        task receive_data();
            `uvm_info("i2c_if", "Receive data to i2c_if", UVM_NONE)
            
        endtask

      
      endinterface


      //  Class: usb_config
      //
      class usb_config extends uvm_object;
        `uvm_object_utils(usb_config);
        
        virtual usb_if usb_vif;
        bit [31:0] usb_base_addr='h200;
        uvm_active_passive_enum active_passive =UVM_ACTIVE;


        //  Constructor: new
        function new(string name = "usb_config");
            super.new(name);
        endfunction: new
        
      endclass: usb_config
      
    //  Class: i2c_config
      //
      class i2c_config extends uvm_object;
        `uvm_object_utils(i2c_config);
        
        virtual i2c_if i2c_vif;
        bit [31:0] i2c_base_addr='h500;
        uvm_active_passive_enum active_passive =UVM_ACTIVE;


        //  Constructor: new
        function new(string name = "i2c_config");
            super.new(name);
        endfunction: new
        
      endclass: i2c_config
      
      //  Class: env_config
      //
      class env_config extends uvm_object;
        `uvm_object_utils(env_config);

        usb_config usb_cfg;
        i2c_config i2c_cfg;       
        bit enable_scoreboard=1;

        //  Constructor: new
        function new(string name = "env_config");
            super.new(name);
        endfunction: new
        
      endclass: env_config
      

      //  Class: usb_driver
      //
      class usb_driver extends uvm_driver;
        `uvm_component_utils(usb_driver);
        usb_config cfg;
        virtual usb_if vif;
        
        //  Constructor: new
        function new(string name = "usb_driver", uvm_component parent);
            super.new(name, parent);
        endfunction: new
      

        function void build_phase(uvm_phase phase);
           super.build_phase(phase);
            if(!uvm_config_db#(usb_config)::get(this,"","usb_cfg",cfg))
                `uvm_fatal(get_name(), "usb_cfg not found")
                
            vif=cfg.usb_vif;

        `uvm_info(get_name(), "Inside build_phase of usb driver", UVM_NONE)
        endfunction: build_phase

        task main_phase(uvm_phase phase);
            phase.raise_objection(this);
            `uvm_info(get_name(), "<main_phase> started, objection raised.", UVM_NONE)
            #100;
            
             vif.send_data();
             vif.receive_data();

            phase.drop_objection(this);
            `uvm_info(get_name(), "<main_phase> finished, objection dropped.", UVM_NONE)
        endtask: main_phase
        
        
        
      endclass: usb_driver

    //  Class: usb_monitor
    //
    class usb_monitor extends uvm_component;
        `uvm_component_utils(usb_monitor);
    
        //  Constructor: new
        function new(string name = "usb_monitor", uvm_component parent);
            super.new(name, parent);
        endfunction: new

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
         `uvm_info(get_name(), "Inside build_phase of usb monitor", UVM_NONE)
             
         endfunction: build_phase
        
         task main_phase(uvm_phase phase);
            phase.raise_objection(this);
            `uvm_info(get_name(), "<main_phase> started, objection raised.", UVM_NONE)
            #100;
            
        
            phase.drop_objection(this);
            `uvm_info(get_name(), "<main_phase> finished, objection dropped.", UVM_NONE)
        endtask: main_phase
        
    endclass: usb_monitor
    


         //  Class: i2c_driver
      //
    class i2c_driver extends uvm_driver;
        `uvm_component_utils(i2c_driver);
      
        
        //  Constructor: new
        function new(string name = "i2c_driver", uvm_component parent);
            super.new(name, parent);
        endfunction: new
      

        function void build_phase(uvm_phase phase);
           super.build_phase(phase);
        `uvm_info(get_name(), "Inside build_phase of i2c driver", UVM_NONE)
            
        endfunction: build_phase
        
        task main_phase(uvm_phase phase);
            phase.raise_objection(this);
            `uvm_info(get_name(), "<main_phase> started, objection raised.", UVM_NONE)
            #100;
            
        
            phase.drop_objection(this);
            `uvm_info(get_name(), "<main_phase> finished, objection dropped.", UVM_NONE)
        endtask: main_phase
        
        
      endclass: i2c_driver

    //  Class: i2c_monitor
    //
    class i2c_monitor extends uvm_component;
        `uvm_component_utils(i2c_monitor);
    
        //  Constructor: new
        function new(string name = "i2c_monitor", uvm_component parent);
            super.new(name, parent);
        endfunction: new

        function void build_phase(uvm_phase phase);
            super.build_phase(phase);
         `uvm_info(get_name(), "Inside build_phase of i2c monitor", UVM_NONE)
             
         endfunction: build_phase
        
         task main_phase(uvm_phase phase);
            phase.raise_objection(this);
            `uvm_info(get_name(), "<main_phase> started, objection raised.", UVM_NONE)
            #100;
            
        
            phase.drop_objection(this);
            `uvm_info(get_name(), "<main_phase> finished, objection dropped.", UVM_NONE)
        endtask: main_phase
        
    endclass: i2c_monitor
    
   class i2c_agent extends uvm_component;
    `uvm_component_utils(i2c_agent);
    usb_driver usb_drv;
    usb_monitor usb_mon;
    i2c_driver  i2c_drv;
    i2c_monitor i2c_mon;

    //  Constructor: new
    function new(string name = "i2c_agent", uvm_component parent);
        super.new(name, parent);
    endfunction: new
   
    function void build_phase(uvm_phase phase);
        i2c_drv=i2c_driver::type_id::create("i2c_drv",this);
        i2c_mon=i2c_monitor::type_id::create("i2c_mon",this);
        
    endfunction: build_phase
    
    
   endclass: i2c_agent
   
   
   class usb_agent extends uvm_component;
   `uvm_component_utils(usb_agent);
   usb_driver usb_drv;
   usb_monitor usb_mon;
   usb_driver  usb_drv;
   usb_monitor usb_mon;

//  Constructor: new
function new(string name = "usb_agent", uvm_component parent);
    super.new(name, parent);
endfunction: new

function void build_phase(uvm_phase phase);
    usb_drv=usb_driver::type_id::create("usb_drv",this);
    usb_mon=usb_monitor::type_id::create("usb_mon",this);
    
endfunction: build_phase


endclass: usb_agent
//  Class: soc_scoreboard
   
   
     //  Class: soc_scoreboard
    //
class soc_scoreboard extends uvm_component;
    `uvm_component_utils(soc_scoreboard);
    
     //  Constructor: new
    function new(string name = "soc_scoreboard", uvm_component parent);
        super.new(name, parent);
    endfunction: new
        
 endclass: soc_scoreboard
    
    //  Class: soc_env
    //
    class soc_env extends uvm_env;
        `uvm_component_utils(soc_env);
        i2c_agent i2c_agt;
        usb_agent usb_agt;
        soc_scoreboard scbd;
        env_config env_cfg;

    
        //  Constructor: new
        function new(string name = "soc_env", uvm_component parent);
            super.new(name, parent);
        endfunction: new
    
        function void build_phase(uvm_phase phase);
            
            if(!uvm_config_db#(env_config)::get(this,"","env_cfg", env_cfg))
                `uvm_fatal(get_name(), "env_cfg not found....")
            
            if(env_cfg.enable_scoreboard)
                scbd=soc_scoreboard::type_id::create("scbd",this);

            uvm_config_db#(usb_config)::set(this,"*","usb_cfg",env_cfg.usb_cfg);
            uvm_config_db#(i2c_config)::set(this,"*","i2c_cfg",env_cfg.i2c_cfg);

            
            i2c_agt=i2c_agent::type_id::create("i2c_agt",this);
            usb_agt=usb_agent::type_id::create("usb_agt",this);
            
            
            
        endfunction: build_phase
        
                
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        uvm_top.print_topology();
        
    endfunction: end_of_elaboration_phase
        
    endclass: soc_env
    
   //  Class: i2c_agent
   //

   

    //  Class: soc_test
    //
    class soc_test extends uvm_component;
        `uvm_component_utils(soc_test);
        usb_config usb_cfg;
        i2c_config i2c_cfg;    
        env_config  env_cfg;
        soc_env env;
       
        function new(string name = "soc_test", uvm_component parent);
            super.new(name, parent);
        endfunction: new

        function void build_phase(uvm_phase phase);
            usb_cfg=usb_config::type_id::create("usb_cfg");
            i2c_cfg=i2c_config::type_id::create("i2c_cfg");
            env_cfg=env_config::type_id::create("env_cfg");
            usb_cfg.usb_base_addr='hbeef;
            i2c_cfg.i2c_base_addr='hbeef;
            env_cfg.usb_cfg=usb_cfg;
            env_cfg.i2c_cfg=i2c_cfg;   
            usb_cfg.usb_base_addr='hdead;
            i2c_cfg.i2c_base_addr='hdead;
            
            //See how through the configuration object we can control if we want scoreboard or not
            env_cfg.enable_scoreboard=1;
            uvm_config_db#(virtual i2c_if)::get(this,"","vif_i2c", i2c_cfg.i2c_vif);
            uvm_config_db#(virtual usb_if)::get(this,"","vif_usb", usb_cfg.usb_vif);
            uvm_config_db#(env_config)::set(this,"env","env_cfg", env_cfg);
            env=soc_env::type_id::create("env",this);
            
        endfunction: build_phase
        
    function void end_of_elaboration_phase(uvm_phase phase);
        super.end_of_elaboration_phase(phase);
        uvm_top.print_topology();
        
    endfunction: end_of_elaboration_phase
    
    task main_phase(uvm_phase phase);
        phase.raise_objection(this);
        `uvm_info(get_name(), "<main_phase> started, objection raised.", UVM_NONE)
        #100;
        
    
        phase.drop_objection(this);
        `uvm_info(get_name(), "<main_phase> finished, objection dropped.", UVM_NONE)
    endtask: main_phase
        
    endclass: soc_test
    
    module tb();
        usb_if vif_usb();
        i2c_if vif_i2c();

        initial begin

            uvm_config_db#(virtual usb_if)::set(null,"uvm_test_top","vif_usb",vif_usb);
            uvm_config_db#(virtual i2c_if)::set(null,"uvm_test_top","vif_i2c",vif_i2c);
            run_test("soc_test");
        end

    endmodule
      
      