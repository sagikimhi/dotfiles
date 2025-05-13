//-----------------------------------------------------------------------------
// Project       : Callisto
//-----------------------------------------------------------------------------
// io::file          : pss_cmn_top.sv
// Author        : skimhi
// Created       : Fri Sep 2024, 14:36:27
// Last modified : Fri Sep 2024, 14:36:27
//
//-----------------------------------------------------------------------------
// Copyright (c) Speedata.
//------------------------------------------------------------------------------
// Modification history:
// Fri Sep 2024, 14:36:27
//-----------------------------------------------------------------------------

`ifndef PSS_CMN_TOP_SV
`define PSS_CMN_TOP_SV

`timescale 1ns / 1ns

`include "pss_cmn_defines.svh"
`include "uvm_macros.svh"
`include "verif_common_defines.svh"

import uvm_pkg::*;
import verif_common_pkg::*;
import sp_base_classes_pkg::*;
import pss_cmn_pkg::*;

typedef byte bytes[$];

class test extends sp_base_test;
    `pss_cmn_component(test)

    io::file m_file;

    virtual task
    run_phase(uvm_phase phase);
        super.run_phase(phase);
        phase.raise_objection(this);
        this.main();
        phase.drop_objection(this);
    endtask: run_phase

    virtual task main();
        string _fname;
        string _lines[$];

        _fname = "./test.txt";
        _lines.push_back("abcdefg");
        _lines.push_back("");
        _lines.push_back("gfedcba");
        _lines.push_back("acdb");

        this.write_testfile(_fname, _lines);
        this.invoke_methods_and_print_res();
        this.read_testfile(_fname, _lines);
    endtask: main

    virtual task
    write_testfile(input string _fname, string _lines[$]);
        m_file = io::file::open(_fname, "w");

        foreach (_lines[i])
            m_file.writeln(_lines[i]);

        m_file.close();
    endtask: write_testfile

    virtual task
    read_testfile(input string _fname, input string _expected_q[$]);
        int _i;
        io::file m_file;
        string _expected;
        string _actual;

        _i = 0;
        this.m_file = io::file::open(_fname, "r");

        foreach (_expected_q[i]) begin
            _expected = {_expected_q[i], "\n"};
            _actual = this.m_file.readline();

            this.report_file_info();
            this.report_value_info(_expected, _actual);
            this.check_result(_expected, _actual);

            _actual = "";
            _expected = "";
            _i++;
        end
    endtask: read_testfile

    virtual function void
    check_result(string _expected, string _actual);
        assert (_expected == _actual)
        else this.panic(_expected, _actual);
    endfunction: check_result

    virtual function void
    panic(string _expected, string _actual);
        this.m_file.close();
        $fatal(1, $sformatf(
            "Expected != Actual\nASCII: (%s != %s)\nBytes: (%p != %p)",
            _expected, _actual, bytes'(_expected), bytes'(_actual)
        ));
    endfunction: panic

    virtual task
    invoke_methods_and_print_res();
        this.m_file = this.m_file.open(this.m_file.path(), "r");
        `sp_info($sformatf(""));
        `sp_info($sformatf("after open (mode): %s", this.m_file.mode()));
        `sp_info($sformatf("after open (path): %s", this.m_file.path()));
        `sp_info($sformatf("after open (eof): %%0d=%0d, %%0h=%0h", this.m_file.eof(), this.m_file.eof()));
        `sp_info($sformatf("after open (tell): %%0d=%0d, %%0h=%0h", this.m_file.tell(), this.m_file.tell()));
        `sp_info($sformatf("after open (size): %%0d=%0d, %%0h=%0h", this.m_file.size(), this.m_file.size()));
        `sp_info($sformatf("after open (fileno): %%0d=%0d, %%0h=%0h", this.m_file.fileno(), this.m_file.fileno()));
        `sp_info($sformatf("after open (bytes_read): %%0d=%0d, %%0h=%0h", this.m_file.bytes_read(), this.m_file.bytes_read()));
        `sp_info($sformatf("after open (bytes_unread): %%0d=%0d, %%0h=%0h", this.m_file.bytes_unread(), this.m_file.bytes_unread()));
        `sp_info($sformatf(""));
        `sp_info($sformatf(""));
        `sp_info($sformatf("read()=%s", this.m_file.read()));
        `sp_info($sformatf("after read (mode): %s", this.m_file.mode()));
        `sp_info($sformatf("after read (path): %s", this.m_file.path()));
        `sp_info($sformatf("after read (eof): %%0d=%0d, %%0h=%0h", this.m_file.eof(), this.m_file.eof()));
        `sp_info($sformatf("after read (tell): %%0d=%0d, %%0h=%0h", this.m_file.tell(), this.m_file.tell()));
        `sp_info($sformatf("after read (size): %%0d=%0d, %%0h=%0h", this.m_file.size(), this.m_file.size()));
        `sp_info($sformatf("after read (fileno): %%0d=%0d, %%0h=%0h", this.m_file.fileno(), this.m_file.fileno()));
        `sp_info($sformatf("after read (bytes_read): %%0d=%0d, %%0h=%0h", this.m_file.bytes_read(), this.m_file.bytes_read()));
        `sp_info($sformatf("after read (bytes_unread): %%0d=%0d, %%0h=%0h", this.m_file.bytes_unread(), this.m_file.bytes_unread()));
        `sp_info($sformatf(""));
        `sp_info($sformatf(""));
        this.m_file.rewind();
        `sp_info($sformatf("readall()=%s", this.m_file.readall()));
        `sp_info($sformatf("after readall (mode): %s", this.m_file.mode()));
        `sp_info($sformatf("after readall (path): %s", this.m_file.path()));
        `sp_info($sformatf("after readall (eof): %%0d=%0d, %%0h=%0h", this.m_file.eof(), this.m_file.eof()));
        `sp_info($sformatf("after readall (tell): %%0d=%0d, %%0h=%0h", this.m_file.tell(), this.m_file.tell()));
        `sp_info($sformatf("after readall (size): %%0d=%0d, %%0h=%0h", this.m_file.size(), this.m_file.size()));
        `sp_info($sformatf("after readall (fileno): %%0d=%0d, %%0h=%0h", this.m_file.fileno(), this.m_file.fileno()));
        `sp_info($sformatf("after readall (bytes_read): %%0d=%0d, %%0h=%0h", this.m_file.bytes_read(), this.m_file.bytes_read()));
        `sp_info($sformatf("after readall (bytes_unread): %%0d=%0d, %%0h=%0h", this.m_file.bytes_unread(), this.m_file.bytes_unread()));
        `sp_info($sformatf(""));
        `sp_info($sformatf(""));
        this.m_file.rewind();
        `sp_info($sformatf("after rewind (mode): %s", this.m_file.mode()));
        `sp_info($sformatf("after rewind (path): %s", this.m_file.path()));
        `sp_info($sformatf("after rewind (eof): %%0d=%0d, %%0h=%0h", this.m_file.eof(), this.m_file.eof()));
        `sp_info($sformatf("after rewind (tell): %%0d=%0d, %%0h=%0h", this.m_file.tell(), this.m_file.tell()));
        `sp_info($sformatf("after rewind (size): %%0d=%0d, %%0h=%0h", this.m_file.size(), this.m_file.size()));
        `sp_info($sformatf("after rewind (fileno): %%0d=%0d, %%0h=%0h", this.m_file.fileno(), this.m_file.fileno()));
        `sp_info($sformatf("after rewind (bytes_read): %%0d=%0d, %%0h=%0h", this.m_file.bytes_read(), this.m_file.bytes_read()));
        `sp_info($sformatf("after rewind (bytes_unread): %%0d=%0d, %%0h=%0h", this.m_file.bytes_unread(), this.m_file.bytes_unread()));
        `sp_info($sformatf(""));
        `sp_info($sformatf(""));
        `sp_info($sformatf("readline()=%s", this.m_file.readline()));
        `sp_info($sformatf("after readline (mode): %s", this.m_file.mode()));
        `sp_info($sformatf("after readline (path): %s", this.m_file.path()));
        `sp_info($sformatf("after readline (eof): %%0d=%0d, %%0h=%0h", this.m_file.eof(), this.m_file.eof()));
        `sp_info($sformatf("after readline (tell): %%0d=%0d, %%0h=%0h", this.m_file.tell(), this.m_file.tell()));
        `sp_info($sformatf("after readline (size): %%0d=%0d, %%0h=%0h", this.m_file.size(), this.m_file.size()));
        `sp_info($sformatf("after readline (fileno): %%0d=%0d, %%0h=%0h", this.m_file.fileno(), this.m_file.fileno()));
        `sp_info($sformatf("after readline (bytes_read): %%0d=%0d, %%0h=%0h", this.m_file.bytes_read(), this.m_file.bytes_read()));
        `sp_info($sformatf("after readline (bytes_unread): %%0d=%0d, %%0h=%0h", this.m_file.bytes_unread(), this.m_file.bytes_unread()));
        `sp_info($sformatf(""));
        `sp_info($sformatf(""));
    endtask: invoke_methods_and_print_res

    virtual function void
    report_file_info();
        `sp_info($sformatf("fileno: %%0d=%0d, %%0h=%0h", this.m_file.fileno(), this.m_file.fileno()));
        `sp_info($sformatf("mode: %s", this.m_file.mode()));
        `sp_info($sformatf("path: %s", this.m_file.path()));
        `sp_info($sformatf("eof: %%0d=%0d, %%0h=%0h", this.m_file.eof(), this.m_file.eof()));
        `sp_info($sformatf("tell: %%0d=%0d, %%0h=%0h", this.m_file.tell(), this.m_file.tell()));
        `sp_info($sformatf("size: %%0d=%0d, %%0h=%0h", this.m_file.size(), this.m_file.size()));
        `sp_info($sformatf("bytes_read: %%0d=%0d, %%0h=%0h", this.m_file.bytes_read(), this.m_file.bytes_read()));
        `sp_info($sformatf("bytes_unread: %%0d=%0d, %%0h=%0h", this.m_file.bytes_unread(), this.m_file.bytes_unread()));
    endfunction: report_file_info

    virtual function void
    report_value_info(string _expected, string _actual);
        `sp_info($sformatf("Expected (bytes): %p", bytes'(_expected)));
        `sp_info($sformatf("Actual (bytes): %p", bytes'(_actual)));
        `sp_info($sformatf("Expected (ASCII): %s", _expected));
        `sp_info($sformatf("Actual (ASCII): %s", _actual));
    endfunction: report_value_info

endclass: test
`pss_cmn_end_namespace

module pss_cmn_top;

    // -----------------------------------------------------------------------------
    //  Wires Declarations
    // -----------------------------------------------------------------------------

    wire clk;
    wire reset_n;

    // -----------------------------------------------------------------------------
    //  Sim Base Run
    // -----------------------------------------------------------------------------

    initial begin
        run_test();
        $finish();
    end

    // -----------------------------------------------------------------------------
    // clock / reset generator
    // -----------------------------------------------------------------------------
    clock_reset_gen
    #(
        .RESET_START_LEVEL (1),
        .RESET_GO_LOW      (10),
        .RESET_GO_HIGH     (90),
        .CLOCK_HIGH_WIDTH  (2),
        .CLOCK_LOW_WIDTH   (4)
    ) clock_reset_gen
    (
        .clk(clk), .reset_n(reset_n)
    );

endmodule // pss_cmn_top

`endif // PSS_CMN_TOP_SV
