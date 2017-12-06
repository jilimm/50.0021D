/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

/*
   Parameters:
     CLK_FREQ = 50000000
     MIN_DELAY = 200
     NUM_SYNC = 2
*/
module bishibashi_detector_3 (
    input clk,
    input bish,
    input bash,
    input shi,
    output reg [2:0] out
  );
  
  localparam CLK_FREQ = 26'h2faf080;
  localparam MIN_DELAY = 8'hc8;
  localparam NUM_SYNC = 2'h2;
  
  
  wire [1-1:0] M_edge_detector_bish_out;
  reg [1-1:0] M_edge_detector_bish_in;
  edge_detector_4 edge_detector_bish (
    .clk(clk),
    .in(M_edge_detector_bish_in),
    .out(M_edge_detector_bish_out)
  );
  wire [1-1:0] M_button_cond_bish_out;
  reg [1-1:0] M_button_cond_bish_in;
  button_conditioner_5 button_cond_bish (
    .clk(clk),
    .in(M_button_cond_bish_in),
    .out(M_button_cond_bish_out)
  );
  wire [1-1:0] M_edge_detector_bash_out;
  reg [1-1:0] M_edge_detector_bash_in;
  edge_detector_4 edge_detector_bash (
    .clk(clk),
    .in(M_edge_detector_bash_in),
    .out(M_edge_detector_bash_out)
  );
  wire [1-1:0] M_button_cond_bash_out;
  reg [1-1:0] M_button_cond_bash_in;
  button_conditioner_5 button_cond_bash (
    .clk(clk),
    .in(M_button_cond_bash_in),
    .out(M_button_cond_bash_out)
  );
  wire [1-1:0] M_edge_detector_shi_out;
  reg [1-1:0] M_edge_detector_shi_in;
  edge_detector_4 edge_detector_shi (
    .clk(clk),
    .in(M_edge_detector_shi_in),
    .out(M_edge_detector_shi_out)
  );
  wire [1-1:0] M_button_cond_shi_out;
  reg [1-1:0] M_button_cond_shi_in;
  button_conditioner_5 button_cond_shi (
    .clk(clk),
    .in(M_button_cond_shi_in),
    .out(M_button_cond_shi_out)
  );
  wire [1-1:0] M_sync_bish_out;
  reg [1-1:0] M_sync_bish_in;
  pipeline_10 sync_bish (
    .clk(clk),
    .in(M_sync_bish_in),
    .out(M_sync_bish_out)
  );
  wire [1-1:0] M_sync_bash_out;
  reg [1-1:0] M_sync_bash_in;
  pipeline_10 sync_bash (
    .clk(clk),
    .in(M_sync_bash_in),
    .out(M_sync_bash_out)
  );
  wire [1-1:0] M_sync_shi_out;
  reg [1-1:0] M_sync_shi_in;
  pipeline_10 sync_shi (
    .clk(clk),
    .in(M_sync_shi_in),
    .out(M_sync_shi_out)
  );
  reg [23:0] M_ctr_d, M_ctr_q = 1'h0;
  
  always @* begin
    M_ctr_d = M_ctr_q;
    
    M_sync_bish_in = bish;
    M_sync_bash_in = bash;
    M_sync_shi_in = shi;
    M_button_cond_bish_in = bish;
    M_edge_detector_bish_in = M_button_cond_bish_out;
    M_button_cond_bash_in = bash;
    M_edge_detector_bash_in = M_button_cond_bash_out;
    M_button_cond_shi_in = shi;
    M_edge_detector_shi_in = M_button_cond_shi_out;
    out = 3'h0;
    if (!(&M_ctr_q)) begin
      M_ctr_d = M_ctr_q + 1'h1;
      out = M_edge_detector_bish_out * 3'h4 + M_edge_detector_shi_out * 2'h2 + M_edge_detector_bash_out;
    end
    if (!M_sync_bash_out & !M_sync_bish_out & !M_sync_shi_out) begin
      M_ctr_d = 1'h0;
    end
  end
  
  always @(posedge clk) begin
    M_ctr_q <= M_ctr_d;
  end
  
endmodule
