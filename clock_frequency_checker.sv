
task automatic clock_freq_checker(input logic clk,input int freq);
shortreal t1,t2,actual,desired;

 @(posedge clk)
 t1=$realtime();

 @(posedge clk)
 t2=$realtime();

actual=t2-t1;
desired=1/freq;


if (actual != desired) begin
    ``uvm_error(get_name(), "Mismatch in the frequency ")
end
else begin
    ``uvm_info(get_name(), "Frquency is as expected....", UVM_NONE)
end

endtask