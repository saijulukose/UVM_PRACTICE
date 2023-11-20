//  Module: 4_Verbosity_and_ID_Top
//
module tb_top();
  
  driver drv;

  initial begin
   drv=new("DRV",null);
   drv.set_report_id_verbosity("DRV1",UVM_HIGH);
   drv.run();
  end


    
endmodule
