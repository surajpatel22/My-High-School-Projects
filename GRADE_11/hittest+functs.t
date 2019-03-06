function recthit (ax1, ay1, ax2, ay2, bx1, by1, bx2, by2)

    if ax1 <= bx2 & ax2 >= bx1 & ay1 >= by2 & ay2 > by1 then
	result true
    else
	result false
    end if

end recthit


function circhit (x1, y1, r1, x2, y2, r2)

    if (y2 - y1) ** + (x2 - x1) ** <= r1 + r2 then
	result true
    else 
	result false
    end if

end circhit
