/* ===========================================================================
  Filename    : mux.sv                                         
  Designers   : Fernando WELZEL
  Description : This module implements a simple variable size multiplexing
                element.   
=========================================================================== */
module mux #(
    parameter int     WIDTH = 2, // Number of bits in each signal to be selected
    parameter int SEL_WIDTH = 1  // Number of selection bits
  )(
    // TODO: Unpacked to Packed conversion CHECK
    // Data variables definition
    input  logic  [2**SEL_WIDTH-1:0] [WIDTH-1:0] data_in, // Input matrix 
    output logic  [WIDTH-1:0] data_out,               // Output vector

    input  logic [SEL_WIDTH-1:0] sel  // Selection signal
);

// == Behavioral declarations ===============================================
always_comb begin
    data_out = 0; // If selection doesn't correspond to any input -> output = 0
    for ( int i = 0; i < 2**SEL_WIDTH; i++ ) begin
        if ( sel == i ) begin
            data_out = data_in[i];
        end
    end
end
endmodule