module key(
    input sys_clk,
    input sys_rst,
    input key,
    output reg key_status
);

reg key_posedge; /* 按键跳变 */
reg key_negedge; 
reg key_k0;     /* 当前按键值 */
reg key_k1;     /* 前一秒按键值 */

assign key_posedge = key_k0 & (~key_k1);    /* 上升沿 */
assign key_negedge = (~key_k0) & key_k1;    /* 下降沿 */

always @(posedge sys_clk or negedge sys_rst) begin
    if (!sys_rst) begin 
        key_k0 <= 0;
        key_k1 <= 1;
    end
    else begin
        key_k0 <= key;
        key_k1 <= key_k0;
    end
end

/* 状态改变 */
always @(posedge sys_clk or negedge sys_rst) begin
    if () begin 
    
    end
    else begin
    
    end
end


endmodule 