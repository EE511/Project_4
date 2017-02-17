%%--------------------------------------------------------------------------
%%Project-4:: Question - 1a
%%To Simulate integrals using a Monte Carlo Simulation
%%Author                Date               Revision
%%Rajasekar Raja     02/15/17         Initial Revision
%%--------------------------------------------------------------------------
function [ ] = monte_carlo_simulation()
  %Initialize
  exp_fun = @(x) exp(x+x.^2);
  Upper_Bound = 2;
  Lower_bound = -2;
  theo_integral = integral(exp_fun,Lower_bound,Upper_Bound);
  disp(['Theoritical Integral = ',num2str(theo_integral)]);  
  %Shift the (0,1) interval of integral to (-2,2) 
  runs = [1000 10000 100000];
  for expt=1:3
      cum_sum = 0;
      num_of_samples = runs(expt);        
      u_samples = ((rand(1,num_of_samples))*(Upper_Bound-Lower_bound))+ Lower_bound;
      for iter=1:num_of_samples                 
          vector = ((Upper_Bound-Lower_bound)*exp(u_samples(iter) + (u_samples(iter)*u_samples(iter))));
          cum_sum = cum_sum + vector;
      end;
      disp(['Summary for ',num2str(num_of_samples)])
      disp(['Calculated(via Monte Carlo) = ',num2str(cum_sum/num_of_samples)]); 
  end