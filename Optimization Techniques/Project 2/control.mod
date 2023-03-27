#Initial Parameters 
param N;
param tf;
param t0;
param x1_0;
param x2_0;
param delta := (tf - t0) / N;

#Time Sets
set TIME = 0..N;
set TIME_N_1 = 0..(N-1);

#Optimization Vriables
var u {i  in TIME_N_1};
var x1 {i in TIME_N_1};
var x2 {i in TIME_N_1};

# Objective
minimize J: delta * sum {t in TIME_N_1} ((x1[t]-0.4)^2 + (u[t]-7.63)^2) + 50*(x1[2]-0.4)^2 ;

# Constraints
subject to state_1 {t in TIME_N_1} : x2[t] <= 0.4;
subject to state_2 {t in TIME_N_1} : u[t] <= 10;

#Initial Conditions
subject to InitialConditionX1 : x1[0] == x1_0;
subject to InitialConditionX2 : x2[0] == x2_0;

# Model Constraints 
subject to ModelConstraintsX1 {t in 1..(N-1)} : x1[t] == x1[t-1] + delta * x2[t];
subject to ModelConstraintsX2 {t in 1..(N-1)} : x2[t] == x2[t-1] + delta * (-9.8 * sin(x1[t])-3*x2[t] + 0.5 * u[t]);