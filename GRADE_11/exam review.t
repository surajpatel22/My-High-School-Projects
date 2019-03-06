
fcn e : real
    var ans : real := 0
    var fac : int := 1
    for i : 1 .. 12
	fac *= i 
	ans += 1/fac
    end for 
    result ans
end e


fcn sine (x:real): real
    var ans: real := x
    var fac : int := 1
    for i: 3 .. 11 by 2
	fac *= (i-1)*i
	ans -= x**i/fac
    end for
    result ans
end sine

fcn cosine (x:real): real
    var ans: real := 1
    var fac : int := 1
    for i: 2 .. 12 by 2
	fac *= (i-1)*i
	ans -= x**i/fac
    end for
    result ans
end cosine

fcn root (x:real) : real
    var ans : real := 1
    for i : 2 .. 1000
	ans := 0.5*(ans+(x/ans))
    end for
    result ans
end root



put e
put sine(3.1415/6)
put cosine(3.1415/6)
put 2* cosine(3.1415/6)
put root (4)
put root (2)

