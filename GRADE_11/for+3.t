put "positive integer"
var x : int
get x

loop
    exit when x >= 0
    put "input positive ineger"
    get x
end loop

var y : int := 0


for i : 1 .. x
    y*=10 
    y += i
    put y
    
end for


% Teacheres way:
%var input : int
%get input

%for i : 1 .. input
 %   for j :  1 .. i
  %      put j ..
 %   end for
 %   put ""
% end for

