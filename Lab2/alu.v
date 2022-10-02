/*
 * Generated by Digital. Don't modify this file!
 * Any changes will be lost if this file is regenerated.
 */

module half_adder (
  input a,
  input b,
  output sum,
  output cry
);
  assign sum = (a ^ b);
  assign cry = (a & b);
endmodule

module incrementer (
  input [3:0] a,
  input inc,
  output [3:0] y,
  output cry
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
  assign s0 = a[3];
  assign s3 = a[2];
  assign s6 = a[1];
  assign s9 = a[0];
  half_adder half_adder_i0 (
    .a( s9 ),
    .b( inc ),
    .sum( s10 ),
    .cry( s7 )
  );
  half_adder half_adder_i1 (
    .a( s6 ),
    .b( s7 ),
    .sum( s8 ),
    .cry( s4 )
  );
  half_adder half_adder_i2 (
    .a( s3 ),
    .b( s4 ),
    .sum( s5 ),
    .cry( s1 )
  );
  half_adder half_adder_i3 (
    .a( s0 ),
    .b( s1 ),
    .sum( s2 ),
    .cry( cry )
  );
  assign y[3] = s2;
  assign y[2] = s5;
  assign y[1] = s8;
  assign y[0] = s10;
endmodule

module not_neg (
  input [3:0] a,
  input invert,
  input neg,
  output [3:0] y,
  output cry
);
  wire [3:0] s0;
  wire s1;
  assign s0[0] = (a[0] ^ invert);
  assign s0[1] = (a[1] ^ invert);
  assign s0[2] = (a[2] ^ invert);
  assign s0[3] = (a[3] ^ invert);
  assign s1 = (invert & neg);
  incrementer incrementer_i0 (
    .a( s0 ),
    .inc( s1 ),
    .y( y ),
    .cry( cry )
  );
endmodule

module full_adder (
  input a,
  input cin,
  input b,
  output sum,
  output cout
);
  assign sum = (a ^ b ^ cin);
  assign cout = ((cin & a) | (cin & b) | (b & a));
endmodule

module four_bit_adder (
  input [3:0] a,
  input [3:0] b,
  input cin,
  output cout,
  output overfl,
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
  wire cout_temp;
  wire s10;
  wire s11;
  wire s12;
  wire s13;
  wire s14;
  assign s0 = a[3];
  assign s1 = a[2];
  assign s2 = a[1];
  assign s3 = a[0];
  assign s4 = b[3];
  assign s5 = b[2];
  assign s6 = b[1];
  assign s7 = b[0];
  full_adder full_adder_i0 (
    .a( s3 ),
    .cin( cin ),
    .b( s7 ),
    .sum( s12 ),
    .cout( s13 )
  );
  full_adder full_adder_i1 (
    .a( s2 ),
    .cin( s13 ),
    .b( s6 ),
    .sum( s14 ),
    .cout( s10 )
  );
  full_adder full_adder_i2 (
    .a( s1 ),
    .cin( s10 ),
    .b( s5 ),
    .sum( s11 ),
    .cout( s8 )
  );
  full_adder full_adder_i3 (
    .a( s0 ),
    .cin( s8 ),
    .b( s4 ),
    .sum( s9 ),
    .cout( cout_temp )
  );
  assign overfl = (cout_temp ^ s8);
  assign y[3] = s9;
  assign y[2] = s11;
  assign y[1] = s14;
  assign y[0] = s12;
  assign cout = cout_temp;
endmodule

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

module and_add (
  input [3:0] a,
  input [3:0] b,
  input add,
  input cin,
  input pass,
  output cout,
  output overfl,
  output [3:0] y
);
  wire [3:0] s0;
  wire [3:0] s1;
  wire [3:0] s2;
  four_bit_adder four_bit_adder_i0 (
    .a( a ),
    .b( b ),
    .cin( cin ),
    .cout( cout ),
    .overfl( overfl ),
    .y( s0 )
  );
  assign s1[0] = (a[0] & b[0]);
  assign s1[1] = (a[1] & b[1]);
  assign s1[2] = (a[2] & b[2]);
  assign s1[3] = (a[3] & b[3]);
  four_bit_mux four_bit_mux_i1 (
    .a( s1 ),
    .b( s0 ),
    .sel( add ),
    .y( s2 )
  );
  four_bit_mux four_bit_mux_i2 (
    .a( s2 ),
    .b( a ),
    .sel( pass ),
    .y( y )
  );
endmodule

module alu (
  input [3:0] a,
  input invert,
  input [3:0] b,
  input arith,
  input cin,
  input pass,
  output [3:0] y,
  output overfl,
  output cout
);
  wire [3:0] s0;
  not_neg not_neg_i0 (
    .a( a ),
    .invert( invert ),
    .neg( arith ),
    .y( s0 )
  );
  and_add and_add_i1 (
    .a( s0 ),
    .b( b ),
    .add( arith ),
    .cin( cin ),
    .pass( pass ),
    .cout( cout ),
    .overfl( overfl ),
    .y( y )
  );
endmodule
