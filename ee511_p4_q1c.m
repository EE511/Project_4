%%--------------------------------------------------------------------------
%%Project-4:: Question - 1c
%%To Simulate integrals using a Monte Carlo Simulation
%%Author                Date               Revision
%%Rajasekar Raja     02/15/17         Initial Revision
%%--------------------------------------------------------------------------
function [ ] = monte_carlo_simulation()
  %Initialize
  syms x y;
  exp_fun = exp(-((x+y)^2));
  integral_1 = int(exp(-((x+y)^2)),y,0,1);  
  theo_integral = int(integral_1,x,0,1);
  sprintf('Theoritical Integral = %f', theo_integral)
  runs = [1000 10000 100000];
  for expt=1:3
      cum_sum = 0;
      num_of_samples = runs(expt);      
      X_samples = rand(num_of_samples,1);
      Y_samples = rand(num_of_samples,1);
      for iter=1:num_of_samples                 
          vector(iter) = exp(-((X_samples(iter)+Y_samples(iter))^2));
          cum_sum = cum_sum + vector(iter);
      end;
      disp(['Summary for ',num2str(num_of_samples)])
      disp(['Calculated(via Monte Carlo) = ',num2str(cum_sum/num_of_samples)]); 
  end