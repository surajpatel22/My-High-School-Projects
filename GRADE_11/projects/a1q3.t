%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
% Course Code: ICS3U1
% Course Sec : 2
% First Name : Suraj
% Last Name : Patel
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

var answer : int := Rand.Int (1, 1000)
var counter : int := 12
var guess : int
put "Guess a number between 1 and 1000."
loop
    get guess

    counter -= 1

    if guess = answer then
	put "Congratulations!"
    elsif guess > answer & counter > 0 then
	put "Try a smaller number. You have ", counter, " guesses left."
    elsif guess < answer & counter > 0 then 
	put "Try a bigger number. You have ", counter, " guesses left."
    end if

    if counter = 0 then
	put "Game Over!"
    end if

    exit when counter = 0| guess = answer
end loop
