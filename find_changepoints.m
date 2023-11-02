function find_changepoints(data, desired_confidence, startx)
    %++
    % on each call, do the following...
    %
    %   find_changepoints(data(1:split_point, 1))
    %   find_changepoints(data(split_point+1:1000, 1))
    %--
    global global_points;
    
    S = my_cusum(data);
    S_diff = max(S) - min(S);
    
    % Perform the bootstrap experiment a bunch of times...
    runs = 800;
    count = 0;
    for i=1:runs
        % Generate the bootstrap data (randomized data)
        randomized_data = randomize(data);
    
    
        % Calculate the CUSUM of the bootstrap data
        S0 = my_cusum(randomized_data);
        S0_diff = max(S0) - min(S0);
        
        % Check if this CUSUM diff is smaller than the original (S_diff)
        if S0_diff < S_diff
            count = count + 1;
        end
    end
    
    
    
    actual_confidence = (count/runs) * 100;
    
    if actual_confidence > desired_confidence
        % Find the split position
        array = [ abs(min(S)), max(S)];
        abs_array = abs(S);
        

        split_point = find(abs_array == max(abs_array));
    
        % Save the split position
        global_points(end+1) = split_point + startx;
       
        figure(2);
        plot(S,'LineWidth',1.0);
        hold on
        % Recurse
        find_changepoints(data(1:split_point,1), desired_confidence, startx);
        find_changepoints(data(split_point+1:end,1), desired_confidence, split_point+startx);
    
    end

end