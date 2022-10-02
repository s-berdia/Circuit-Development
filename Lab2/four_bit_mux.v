/*
 * Generated by Digital. Don't modify this file!
 * Any changes will be lost if this file is regenerated.
 */

module two_bit_mux (
  input a,
  input b,
  input s,
  output y
);
  assign y = ((a & ~ s) | (b & s));
endmodule

module four_bit_mux (
  input [3:0] a,
  input [3:0] b,
  input sel,
  output [3:0] y
);
  wire s0;
  wire s1;
  wire s2;
  wire s3;
  wire s4;
  wire s5;
  wire s6;
  wire s7;
  wire s8;
  wire s9;
  wire s10;
  wire s11;
  assign s0 = a[3];
  assign s3 = a[2];
  assign s6 = a[1];
  assign s9 = a[0];
  assign s1 = b[3];
  assign s4 = b[2];
  assign s7 = b[1];
  assign s10 = b[0];
  two_bit_mux two_bit_mux_i0 (
    .a( s0 ),
    .b( s1 ),
    .s( sel ),
    .y( s2 )
  );
  two_bit_mux two_bit_mux_i1 (
    .a( s3 ),
    .b( s4 ),
    .s( sel ),
    .y( s5 )
  );
  two_bit_mux two_bit_mux_i2 (
    .a( s6 ),
    .b( s7 ),
    .s( sel ),
    .y( s8 )
  );
  two_bit_mux two_bit_mux_i3 (
    .a( s9 ),
    .b( s10 ),
    .s( sel ),
    .y( s11 )
  );
  assign y[3] = s2;
  assign y[2] = s5;
  assign y[1] = s8;
  assign y[0] = s11;
endmodule
