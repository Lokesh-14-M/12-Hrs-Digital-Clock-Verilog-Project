`timescale 1ns/1ps
module tb();

    reg clk, reset, ena;
    wire pm;
    wire [7:0] hh, mm, ss;

    // Instantiate the DUT (Device Under Test)
    digclk12h uut (
        .clk(clk),
        .reset(reset),
        .ena(ena),
        .pm(pm),
        .hh(hh),
        .mm(mm),
        .ss(ss)
    );

    // Clock generation: 10ns period (100MHz)
    always #5 clk = ~clk;

    // Initial setup
    initial begin
        $dumpfile("digclk12h.vcd");
        $dumpvars(0, tb);

        clk = 0;
        reset = 1;
        ena = 1;
        #20 reset = 0; // Deassert reset after 20ns

        // Run for a long enough duration to see hour changes
        #864020 $finish;
    end

    // Display formatted time whenever seconds change
    reg [7:0] last_ss;
    always @(posedge clk) begin
        if (!reset && ena) begin
            if (ss != last_ss) begin
                $display("TIME = %0d%0d:%0d%0d:%0d%0d %s",
                    hh[7:4], hh[3:0],
                    mm[7:4], mm[3:0],
                    ss[7:4], ss[3:0],
                    pm ? "PM" : "AM");
                last_ss <= ss;
            end
        end
    end

endmodule

