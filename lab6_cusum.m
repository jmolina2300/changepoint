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

desired_confidence = 95;  %input('Enter confidence level: ');
%data = readmatrix("TwoMeans.csv");
data = readmatrix("changes2.csv");
data = data(2:end,1);

figure(2)
plot(data,'LineWidth',1)


global_points = [];
find_changepoints(data,desired_confidence, 0);



