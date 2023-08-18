/* ===========================================================================
  Filename    : register.sv                                         
  Designers   : Fernando WELZEL
  Description : This module implements a common positive edge-triggerer regis-
                ter. In this case the implemented model is a D flip-flop.
=========================================================================== */
module register #(
    parameter int WIDTH       = 32, // Register input and output data size
    parameter bit RESET_VALUE =  0  // Base reset value
  )(
    // Input/Output data
    input  logic [WIDTH-1:0] data_in,
    output logic [WIDTH-1:0] data_out,

    // Control signal - Edge-triggered
    input logic ctrl,

    // Global control signal
    input logic rst 
);

// == Variable declarations =================================================
reg [WIDTH-1:0] data_internal;

// == Behavioral declarations ===============================================
always @(posedge ctrl, posedge rst) begin
    if ( rst ) data_internal <= {WIDTH{RESET_VALUE}};
    else       data_internal <= data_in;
end

// == Connections ===========================================================
assign data_out = data_internal;

endmodule