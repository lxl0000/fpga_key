`timescale 1ms/1us

module key_tb();
parameter T = 20;

reg sys_clk;
reg sys_rst;
reg key_in;
wire key_status;

initial begin
    key_in  <= 1'b0;
    sys_clk <= 1'b0;
    sys_rst <= 1'b0;
    #T
    sys_rst <= 1'b1;
    
    #(2000*T)
    key_in  <= 1'b0;
    #(20*T)
    key_in  <= 1'b1;  
    #(20*T)
    key_in  <= 1'b0;  
    #(20*T)
    key_in  <= 1'b1;
    #(20*T)
    key_in  <= 1'b0; 
    #(2000*T)
    key_in  <= 1'b1;  
    #(2000000000*T)
    key_in  <= 1'b0; 
    #(20*T)
    key_in  <= 1'b1;  
    #(20*T)
    key_in  <= 1'b0;  
    #(20*T)
    key_in  <= 1'b1; 
    #(20*T)
    key_in  <= 1'b0;   
    #(20*T)
    key_in  <= 1'b1;  
    #(20000*T)
    key_in  <= 1'b0;  
end

always #(T/2) sys_clk <= ~sys_clk; 
 
key u_key(
    .sys_clk   (sys_clk),
    .sys_rst   (sys_rst),
    .key_in    (key_in),
    .key_status(key_status)  /* 按键状态 */
);
endmodule 