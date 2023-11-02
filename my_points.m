classdef my_points

    properties
        points
    end
    
    methods
        function obj = my_points()
            %UNTITLED Construct an instance of this class
            %   Detailed explanation goes here
            obj.points = [];
        end

        function self = add_point(self,value)
            self.points(end+1) = value;
        end
        
    end
end

