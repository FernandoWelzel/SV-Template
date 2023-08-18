/* ===========================================================================
  Filename    : top.sv                                         
  Designers   : Fernando WELZEL
  Description : Top design module.
=========================================================================== */
module top  #(
    parameter int N = 4 // Description
)(
    // Description
    input wire A,
    input wire B,
    
    // Description
    output wire Q,
    
    // Global signals
    input wire rst
);

// == Variable declarations =================================================
logic C;

// == Connections ===========================================================
assign Q = A | B;

endmodule
