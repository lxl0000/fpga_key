module key(
    input       sys_clk,
    input       sys_rst,
    input       key_in,
    output reg  key_status   /* 按键状态 */
);

wire       key_edge;    /* 按键跳变 */
reg [19:0] key_cnt;     /* 按键状态保持时间 */
reg        key_k0;      /* 当前按键值 */
reg        key_k1;      /* 前一秒按键值 */
reg        key_next;    /* 按键下一时刻状态 */

assign key_edge = (key_k0 == key_k1)? 1'b0:1'b1;

always @(posedge sys_clk or negedge sys_rst) begin
    if (!sys_rst) begin 
        key_k0 <= 0;
        key_k1 <= 0;
    end
    else begin
        key_k0 <= key_in;
        key_k1 <= key_k0;
    end
end

/* 状态改变 */
always @(posedge sys_clk or negedge sys_rst) begin
    if (!sys_rst) begin 
        key_status  <= 0;
    end
    else begin
        key_status <= key_next;
    end
end

/* 下一时刻按键状态修改 */
always @(posedge sys_clk or negedge sys_rst) begin
    if (!sys_rst) begin
        key_next <= 0;
    end
    else if (key_cnt == 20'd1000_000) begin
        key_next <= key_in;
    end
    else begin
        key_next <= key_next;
    end
end

/* 计数 */
always @(posedge sys_clk or negedge sys_rst) begin
    if (!sys_rst) begin  /* 复位 */
        key_cnt <= 20'd0;
    end
    else if (key_edge == 1) begin /* 跳变沿 */
        key_cnt <= 1'b0;
    end
    else if ((key_edge == 0) && (key_cnt < 20'd1000_000)) begin
        key_cnt <= key_cnt + 1'b1;
    end
    else begin
        key_cnt <= 20'd1000_000;
    end
end
endmodule 