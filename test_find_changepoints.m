%%
% Title: Lab06 CUSUM charts
%
% Inputs:
%
%  - CSV file
%  - Confidence level
%
% 
% Output:  
% 
%  points where the change in mean occurred.
%   
%%
global global_points;

desired_confidence = 95;           % Confidence Level
data = readmatrix("changes.csv");  % CSV File
%data = readmatrix("changes2.csv");
%data = readmatrix("TwoMeans.csv");
data = data(2:end,1);



global_points = [];
find_changepoints(data,desired_confidence, 0);
disp('The changepoints are: ')
disp(global_points)

% Set proper scale of axes 
yyaxis left
xlim([0 length(data)])
figure(1);
plot(data,'LineWidth',0.5)







