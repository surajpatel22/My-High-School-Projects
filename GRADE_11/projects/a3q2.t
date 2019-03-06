%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U1
% Course Sec : 2
% First Name : Suraj
% Last Name : Patel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

procedure CelsiusToFahrenheitProcedure (cel : real)

    put cel : 4 : 1, "C", " -> ", cel * 1.8 + 32 : 4 : 1, "F"
    
end CelsiusToFahrenheitProcedure




%%%%% Test Cases %%%%%
CelsiusToFahrenheitProcedure (20) % should display "20.0C -> 68.0F"
CelsiusToFahrenheitProcedure (14.5) % should display "14.5C -> 58.1F"
CelsiusToFahrenheitProcedure (32.48) % should display "32.5C -> 90.5F"
    
