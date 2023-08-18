/* ============================== GLOBAL ================================== */
import test_package::class_test;
`timescale 1ns/1ps

/* ===========================================================================
  Filename    : test.sv                                         
  Designers   : Fernando WELZEL
  Description : General test bench for top module.
=========================================================================== */
module testbench #(
    // Test bench parameters
    parameter string VCD_NAME  = "testbench.vcd",
    parameter int    DELAY     = 10
)();

// == Variable declarations =================================================
logic A;
logic B;

// == Variable initialization ===============================================
initial begin
    A = 0;
    B = 0;
end

// == Top module instantiation ==============================================
top #(
  .N(N)  
) dut (
  .A(A),
  .B(B),
  .Q(Q),
  .rst(rst)
);

initial begin
    // Start test and displays its information
    automatic class_test test = new("testbench"); 
    test.start();

    // Reseting test bench values
    rst = 1'b1; #(DELAY);
    rst = 1'b0; #(DELAY);

    // Generating test
    test.add(A == 1, "A should be 1"); #(DELAY);
    
    // Finish testbench and send PASS/FAIL message
    test.finish();    
end

// Simulation timeout and VCD save
initial begin
    // Setting VCD
    $dumpfile(VCD_NAME);
    $dumpvars(0, testbench);
    
    // Setting timeout
    #(TIMEOUT_TIME);
    $display("ERROR: simulation timed out");
    $finish;
end

endmodule
