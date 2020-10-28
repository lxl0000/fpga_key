module key(
    input       sys_clk,
    input       sys_rst,
    input       key,
    output reg  key_status   /* 按键状态，0：默认；1：上升沿；2：下降沿 */
);

localparam KEY_IDLE     = 2'd0;
localparam KEY_POSEDGE  = 2'd1;
localparam KEY_NEGEDGE  = 2'd2;

reg key_posedge; /* 按键跳变 */
reg key_negedge; 
reg key_edge_flag;  /* 跳变沿状态标记，0：空闲；1：上升沿计数过程；2：下降沿计数过程 */
reg key_cnt;        /* 按键状态保持时间 */
reg key_k0;     /* 当前按键值 */
reg key_k1;     /* 前一秒按键值 */
reg key_next;   /* 按键下一时刻状态 */

assign key_posedge = key_k0 & (~key_k1);    /* 上升沿 */
assign key_negedge = (~key_k0) & key_k1;    /* 下降沿 */

always @(posedge sys_clk or negedge sys_rst) begin
    if (!sys_rst) begin 
        key_k0 <= 0;
        key_k1 <= 0;
    end
    else begin
        key_k0 <= key;
        key_k1 <= key_k0;
    end
end

/* 状态改变 */
always @(posedge sys_clk or negedge sys_rst) begin
    if (!sys_rst) begin 
        key_status  <= KEY_IDLE;
        key_next    <= KEY_IDLE;
    end
    else begin
        key_status <= key_next;
    end
end

/* 下一时刻按键状态修改 */
always @(*) begin
    case (key_status)
        KEY_IDLE: begin 
            if () begin
            
            end
            else begin
            
            end
        end
        KEY_POSEDGE: begin
        
        end
        KEY_NEGEDGE: begin
        
        end
        default: begin
        
        end
    endcase
end

always @(posedge sys_clk or negedge sys_rst) begin
    if (!sys_rst) begin
        key_edge_flag <= 2'd0;
        key_cnt <= 20'd0;
    end
    else begin
    
    end
end
endmodule 