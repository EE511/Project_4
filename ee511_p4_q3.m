%%--------------------------------------------------------------------------
%%Project-4:: Question - 3
%%To Simulate Statistical confidence intervals
%%Author                Date               Revision
%%Rajasekar Raja     02/15/17         Initial Revision
%%--------------------------------------------------------------------------
function [ ] = stat_confi_interval()
  %Loading faithful.txt file into the matlab
  fullname = fullfile('D:\Usc\Sem1\511\Project4','faithful.txt');
  %Initialize
  loaded_data= load(fullname);
  waiting_time_272 = loaded_data(:,3);
  waiting_time_15 = waiting_time_272(1:15);
  mean_waiting_time_15 = mean(waiting_time_15);
  mean_waiting_time_272 = mean(waiting_time_272);
  for expt=1:2
      if expt ==1
          waiting_time = waiting_time_15;
          mean_waiting_time = mean_waiting_time_15;
          len = 15;
      else
          waiting_time = waiting_time_272;
          mean_waiting_time = mean_waiting_time_272;
          len = 272;
      end
      disp(['Summary for ',num2str(len),' samples:']);
      for iter=1:100
          r_numbers = randi([44 125],1,len);
          x_bar(iter) = mean(r_numbers);
          samp_std(iter) = std(r_numbers); 
          std_error(iter) = samp_std(iter)/sqrt(len);
          t_dist(iter) = (x_bar(iter) - mean_waiting_time)/(samp_std(iter)/sqrt(len));      
          margin_of_error(iter) = t_dist(iter)*std_error(iter);      
      end;
      boot_ci = bootci(len,@mean,waiting_time);
      ci_low = mean_waiting_time - mean(margin_of_error);
      ci_high = mean_waiting_time + mean(margin_of_error);  
      sprintf('The Confidence Interval calculated positive marginal error = %f', ci_high)
      sprintf('The Confidence Interval_with negative marginal error = %f', ci_low)
      sprintf('The bootstrap confidence interval is= %f', boot_ci)
  end;