% Readme
% Asjad (4830568)
% Usage: Type roby(). in command prompt
 
% board is represented by valid path points or states that robot can take to reach the goal

validpp(2,6).
validpp(2,5).
validpp(2,4).
validpp(2,3).
validpp(2,2).

validpp(3,6).
validpp(3,3).
validpp(3,2).

validpp(4,6).
validpp(4,5).
validpp(4,4).
validpp(4,2).

validpp(5,6).
validpp(5,4).
validpp(5,2).

validpp(6,6).
validpp(6,3).
validpp(6,2).

validpp(7,6).
validpp(7,5).
validpp(7,4).
validpp(7,3).
validpp(7,1).

validpp(8,2).
validpp(8,1).


% moves one position up,down,right or left by incrementing the value of (x,y) 

move_pos(PrevX,PrevY,PrevX,Y) :- Y is PrevY+1. % move one position Up
move_pos(PrevX,PrevY,X,PrevY) :- X is PrevX+1. % move one position right
move_pos(PrevX,PrevY,PrevX,Y) :- Y is PrevY-1. % move one position down
move_pos(PrevX,PrevY,X,PrevY) :- X is PrevX-1. % move one position left


%  we recursively check the surrounding states of the robot to see if any of them is a valid state that robot can move to. 
%  and we check  if the position/state has already been visited by using alreadyvisited predicate. 
%  In case new a valid position is available and has not been visited before we move the position of the robot by one block 
%  and we add it to the Goalpath list and the alreadyvisited Path list and continue doing it untill all options have been exhausted 

notvisited(_, []) :- !.

notvisited(X, [H|T]) :-
     X \= H,
    notvisited(X, T).

findGoalPath(X,Y,X,Y,GoalPath,GoalPath).
findGoalPath(PrevX,PrevY,X,Y,AlreadyVisitedPath,GoalPath) :- validpp(NextX,NextY), move_pos(PrevX,PrevY,NextX,NextY), notvisited(validpp(NextX,NextY),AlreadyVisitedPath), findGoalPath(NextX,NextY,X,Y,[validpp(NextX,NextY)|AlreadyVisitedPath],GoalPath).



roby():-(findGoalPath(5,4,7,3,[],Path)), append(Path,[validpp(5,4)],Path2),write(Path2), fail.

