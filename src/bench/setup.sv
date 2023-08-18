/* ===========================================================================
  Package     : test_package
  Description : This package implements all the classes to keep track of a test
                bench.                                     
=========================================================================== */
package test_package;
    // Main class to keep track of the test variables    
    class class_test;
        // Class variables
        int sucess; // Number of sucessfull tests
        int failed; // Number of failed test
        int total;  // Number of tests performed
        string module_name; // Name of the tested module

        // Method to create the class with default values
        function new( input string module_name );
            this.sucess = 0;
            this.failed = 0;
            this.total  = 0;
            this.module_name = module_name; 
        endfunction

        // Function to add a new test and perform it
        function void add(input bit condition, input string message );
            if ( !condition ) begin
                $display("At %0t: %s", $time, message); // Displays error message
                failed++; // Increment the number of failed tests
            end
            else begin
                sucess++; // Increments the number of successfull tests
            end

            total++; // Increments the total number of tests        
        endfunction

        // Function to print message when test begins
        function void start();
	    $display("============================================================================");
            $display("Test for module %s has started", module_name);
        endfunction

        // Function to finish test and send correct code according to the test state
        function void finish();
            // Prints test results
	    $display("============================================================================");
            if( sucess == total ) begin
                $display("PASS:   Module %s passed %0d of %0d tests!", module_name, sucess, sucess);
            end
            else begin
                $display("FAILED: Module %s passed %0d of %0d tests!", module_name, sucess, total); 
            end
	    $display("============================================================================");

            // Sending return value
            $finish(sucess == total);
        endfunction
    endclass;
endpackage
