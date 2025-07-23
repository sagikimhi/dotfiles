//-----------------------------------------------------------------------------
// Project       : Pixie
//-----------------------------------------------------------------------------
//
// File          : top.sv
// Author        : sagikimhi
// Created       : Fri Mar 2025, 01:24:14
// Last modified : Fri Mar 2025, 01:24:14
//
//-----------------------------------------------------------------------------
// Copyright (c) Wiliot.
//------------------------------------------------------------------------------
// Modification history:
// Fri Mar 2025, 01:24:14
//-----------------------------------------------------------------------------

`ifndef TOP_SV
`define TOP_SV

`timescale 1ns / 1ns

`include "uvm_macros.svh"

module top
    import uvm_pkg::*;
#();


    wire clk;
    wire rst_n;

    clk_rst_if#() u_clk_rst(.clk(clk), .rst_n(rst_n));
    env_module#() u_env_module(.clk(clk), .rst_n(rst_n));

    generate
        initial u_clk_rst.set_sole_clock(1);
        initial u_clk_rst.set_active(1, 1);
    endgenerate
endmodule

`endif // TOP_SV
