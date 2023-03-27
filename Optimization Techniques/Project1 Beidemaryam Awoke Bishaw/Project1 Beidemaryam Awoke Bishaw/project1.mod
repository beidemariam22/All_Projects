param n; # no of variables 
param m; # no of constraint

param C{1..n};
param A{1..m, 1..n};
param B{1..m};

var x {i in 1..n}  >=0;

minimize z: sum {i in 1..n} C[i] * x[i] ;  # x is a vector of decision variables 

s.t. constraint {j in 1..m}: sum{i in 1..n} A[j,i]*x[i] >=B[j];
s.t. M1: 3*x[1] + 6*x[2] + x[3] + 2*x[4] + 20*x[5] = 10;
s.t. M2 {i in 1..n}: x[i] >= 0;

