function result = my_cusum(data)
    % Intialize CUSUM result array
    S = zeros(length(data) + 1,1);

    % Obtain the average (Xbar)
    xbar = mean(data);
    
    % Compute the CUSUM for the data
    for i = 1:length(data)
        S(i+1) = S(i)  + (xbar - data(i));

    end

    result = S;
end