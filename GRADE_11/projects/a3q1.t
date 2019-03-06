%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U1
% Course Sec : 2
% First Name : Suraj
% Last Name : Patel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

function round2dp (num : real) : real
    result round (100 * num) / 100
end round2dp

function supermarket (veggie, meat, fruit, fish : real) : real
    result round2dp (veggie * 1.29 + meat * 2.49 + fruit * 1.49 + fish * 2.99)
end supermarket
