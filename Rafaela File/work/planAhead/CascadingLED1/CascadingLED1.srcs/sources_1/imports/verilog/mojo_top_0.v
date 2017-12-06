/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [7:0] led,
    input bish,
    input bash,
    input shi,
    output reg [23:0] io_led,
    input [23:0] io_dip
  );
  
  
  
  wire [2-1:0] M_ctr_value;
  counter_1 ctr (
    .clk(clk),
    .rst(rst),
    .value(M_ctr_value)
  );
  wire [3-1:0] M_myBishiBashi_out;
  reg [1-1:0] M_myBishiBashi_bish;
  reg [1-1:0] M_myBishiBashi_bash;
  reg [1-1:0] M_myBishiBashi_shi;
  main_2 myBishiBashi (
    .clk(clk),
    .rst(rst),
    .bish(M_myBishiBashi_bish),
    .bash(M_myBishiBashi_bash),
    .shi(M_myBishiBashi_shi),
    .out(M_myBishiBashi_out)
  );
  
  always @* begin
    M_myBishiBashi_bish = bish;
    M_myBishiBashi_bash = bash;
    M_myBishiBashi_shi = shi;
    led[0+0-:1] = M_myBishiBashi_out[0+0-:1];
    led[1+0-:1] = M_myBishiBashi_out[1+0-:1];
    led[2+0-:1] = M_myBishiBashi_out[2+0-:1];
    led[3+4-:5] = 4'h0;
    io_led = 24'h000000;
    io_led[16+7+0-:1] = io_dip[16+7+0-:1];
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
  end
endmodule