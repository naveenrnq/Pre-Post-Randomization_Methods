// Pre Randomize
// Post Randomize
// Remember we have function name as pre_randomize and post_randomize

class generator;

  randc bit [3:0] a,b;  // rand or randc
  bit [3:0] y;

  int min;
  int max;
  
  // Pre Randomize to setup the constraint
  function void pre_randomize(input int min, input int max);
    this.min = min;
    this.max = max;
  endfunction

  // Set the constraint
  constraint data {
                    a inside {[min:max]};
                    b inside {[min:max]};
                   }
  // Post Randomize to print the value
  // This function will be executed after our randomization agenda is fulfilled
  function void post_randomize();
    $display("Value of a: %0d and b: %0d", a,b);
  endfunction
   
endclass




module tb;
 generator g;
 int i = 0;

 
 initial begin
   g = new();
   for(i = 0; i < 20; i++) begin 
     g.pre_randomize(3,8); // Before randomization
     g.randomize(); // Afterrandomization post_randomize automatically got triggered
     #10; 
   end
 end

endmodule
