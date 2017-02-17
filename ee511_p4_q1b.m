%%--------------------------------------------------------------------------
%%Project-4:: Question - 1b
%%To Simulate integrals using a Monte Carlo Simulation
%%Author                Date               Revision
%%Rajasekar Raja     02/15/17         Initial Revision
%%--------------------------------------------------------------------------
function [ ] = monte_carlo_simulation()
  %Initialize
  exp_fun = @(x) exp(-x.^2);  
  theo_integral = integral(exp_fun,-inf,inf);
  disp(['Theoritical Integral = ',num2str(theo_integral)]);  
  %Shift the (0,1) interval of integrl to (-2,2) 
  runs = [1000 10000 100000];
  %Monte Carlo Simulation got Integrals
  for expt=1:3
      cum_sum1 = 0;
      cum_sum2 = 0;
      num_of_samples = runs(expt);      
      u_samples = rand(num_of_samples,1);
      %o to Inifinite Limit
      for iter=1:num_of_samples                 
          vector(iter) = ((1/u_samples(iter))^2*exp(-((1/u_samples(iter)) -1)^2));
          cum_sum1 = cum_sum1 + vector(iter);
      end;
      %-Inifinite to 0 Limit
      for iter=1:num_of_samples                 
          vector(iter) = ((1/u_samples(iter)^2)*exp(-((1/u_samples(iter)) -1)^2));
          cum_sum2 = cum_sum2 + vector(iter);
      end;
      disp(['Summary for ',num2str(num_of_samples)])
      disp(['Calculated(via Monte Carlo) = ',num2str((cum_sum1+cum_sum2)/num_of_samples)]); 
  end