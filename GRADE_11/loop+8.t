put "This code displays the Fibonacci Sequence"
put "How many terms of the Fibonacci Sequence do you want the program to display?"

var userInput : int
var currentTerm : int := 1
var previousTerm : int := 0
var previousTwoTerm : int := 0
loop
    get userInput
    exit when userInput > 0
    put "Please re-enter a positive integer!"
end loop


loop
    exit when userInput < 1
    put currentTerm
    previousTwoTerm := previousTerm
    previousTerm := currentTerm
    currentTerm += previousTwoTerm
    userInput -= 1
end loop
%%% COMPLETE THE CODE BELOW %%%
