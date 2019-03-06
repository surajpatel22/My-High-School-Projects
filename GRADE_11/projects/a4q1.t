%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U1
% Course Sec : 2
% First Name : Suraj
% Last Name : Patel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%


function palindromic (i : int) : boolean

    var x : string := intstr(i)

    for a: 1 .. length(x) div 2

	if x(a) ~= x(length(x) - a + 1) then
	    result false
	end if
   
    end for
    
    result true
    
end palindromic



