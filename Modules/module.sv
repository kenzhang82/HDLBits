module module 
( 
  input a, 
  input b, 
  output out 
);
  
  mod_a a_inst
  (
    .in1(a),
    .in2(b),
    .out(out)
  );
    
endmodule