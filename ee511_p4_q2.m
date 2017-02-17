%%--------------------------------------------------------------------------
%%Project-4:: Question - 1b
%%Calculate the empiral ditribution of the random variable and overlay the theoretical distribution
%%Author                Date               Revision
%%Rajasekar Raja     02/15/17         Initial Revision
%%--------------------------------------------------------------------------
runs =[10 100 1000];
for expt = 1:1
    num_of_samples = runs(expt);
    %Generate random variable Zi^2
    for iter1=1:num_of_samples
        r_numbers = randn(1,4);
        X(iter1)=sum(r_numbers.^2);
    end
    sort_X_series=sort(X); %For chi2cdf() function.
    [emp_prob,x]=ecdf(X);
    emp_prob=emp_prob.';
    emp_prob = emp_prob(2:num_of_samples+1);
    
    cdfplot(X);% Empirical Distribution Function
    hold on
    theo_prob=chi2cdf(sort_X_series,4); %Theoretical distribution using chi2cdf function
    plot(1:num_of_samples,theo_prob,'linewidth',2); % Overlaying the theoretical distribution over emprical distribution
    hold off
    
    % Calculating the lower bound by iterating over all the sample sizes
    for iter2=1:num_of_samples
    Lower_Bound=max(abs(emp_prob(iter2)- theo_prob(iter2)));
    end
    Theo_90th= chi2inv(0.9,4);
    Theo_50th=chi2inv(0.5,4);
    Theo_25th=chi2inv(0.25,4);
    Prac_25th=prctile(sort_X_series,25);
    Prac_50th=prctile(sort_X_series,50);
    Prac_90th=prctile(sort_X_series,90);
    disp(['Summary for ',num2str(num_of_samples),' samples']);
    disp(['The lower bound of the difference between Emp and theo values=',num2str(Lower_Bound)]);
    disp(['25th percentile Theo ',num2str(Theo_25th),' prac: ',num2str(Prac_25th)]);
    disp(['50th percentile Theo ',num2str(Theo_50th),' prac: ',num2str(Prac_50th)]);
    disp(['90th percentile Theo ',num2str(Theo_90th),' prac: ',num2str(Prac_90th)]);       
end