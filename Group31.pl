% Program: ROYAL

% -------------- GROUP 31 --------------
%       Gabriel Petcu  Student id: 984159
%       Bogdan Lazar   Student id: 978822
%       Lewis Evans    Student id: 956896


parent(queenmother,elisabeth).    parent(elisabeth,charles).
parent(elisabeth,andrew).         parent(elisabeth,anne).
parent(elisabeth,edward).         parent(diana,william).
parent(diana,harry).              parent(sarah,beatrice).
parent(anne,peter).               parent(anne,zara).
parent(george,elisabeth).         parent(philip,charles).
parent(philip,andrew).            parent(philip,edward).
parent(charles,william).          parent(charles,harry).
parent(andrew,beatrice).          parent(andrew,eugenie).
parent(mark,peter).               parent(mark,zara).
parent(william,georgejun).        parent(kate,georgejun).
parent(william,charlotte).        parent(kate,charlotte).
parent(philip,anne).              parent(william,louis).
parent(kate,louis).               parent(harry,archie).
parent(meghan,archie).


the_royal_females([queenmother,elisabeth,anne,diana,sarah,beatrice,zara,kate,charlotte,eugenie]).

the_royal_males([charles,andrew,edward,william,harry,peter,george,philip,mark,georgejun,louis]).

% ------------------------ Question 1 ------------------------
% Q1 - 1
the_royal_family([queenmother,elisabeth,anne,diana,sarah,beatrice,zara,kate,charlotte,eugenie,charles,andrew,edward,william,harry,peter,george,philip,mark,georgejun,louis]).
			  
% Q1- 2		  
father(X,Y) :- parent(X,Y),
			   the_royal_males(L),
			   member(X,L).
			
% Q1- 3          
granddad(X,Z) :- father(X,Y),
				 parent(Y,Z).
							
% Q1- 4  
has_child(X) :- parent(X,_).			  

% Q1- 5
ancestor(X,Y) :- parent(X,Y).
ancestor(X,Y) :- parent(X,A), 
				 ancestor(A,Y).
   
% Q1- 6   
sibling(X,Y) :- parent(A,X),
                parent(A,Y),
				X \= Y.
				 				 
% Q1- 7			 
brother(X,Y) :- sibling(X,Y),
				the_royal_males(M),
				member(X,M).
					
% Q1- 8
% granddad(george,X)

% X = charles;
% X = andrew;
% X = anne;
% X = edward;

% Q1- 9
%has_child(X).

% X = queenmother
% X = elisabeth 
% X = diana 
% X = sarah
% X = anne
% X = george
% X = philip
% X = charles
% X = andrew
% X = mark
% X = william
% X = kate
% X = harry
% X = meghan

% Q1- 10
descendant(X,Y) :- ancestor(Y,X),
					X \= Y.

% descendant(X,diana). Alternatively could have been written as ancestor(diana,X).
% X = william
% X = harry					
% X = georgejun
% X = charlotte
% X = louis
% X = archie

% Q1- 11
%ancestor(X,archie).

% X = harry ;
% X = meghan ;
% X = queenmother ;
% X = elisabeth ;
% X = diana ;
% X = george ;
% X = philip ;
% X = charles ;	
				
 % Q1- 12
has_brother_who_is_granddad(X) :- granddad(Y,_),
								  brother(X,Y).
% X = andrew;
% X = edward;									
									
% ----------------- Question 2 -------------------
% Q2- 1
									
toEven([], []).                                % Base-case: it will stop when the lists are empty.
toEven([H|T], [H1|L]):- 1 is mod(H, 2),        % checks if the head of the list is odd
						!,                     % if the number is even it will backtrack and will find the next number odd. However if the number is even the function will not execute further commands.
						H1 is H*2,             
						toEven(T, L).          % recursive call for the rest of the list.
						
toEven([H|T], [H|L]):- toEven(T, L).           % display the list

% Q2- 2

star(0).                                           % Base-case: it will stop when N will get 0.                                
star(N) :- N > 0,
		   foreach(between(1,N,_) ,write('*')),nl, % display N stars.
		   X is N-1,                               % decremeting N by 1.
		   star(X).                                % recursive call for n-1.

% Same as star(N), but displaying stars ascendantly.		   
star1(1).                                          
star1(N,N2) :- N2 =< N,                                 
			   foreach(between(1,N2,_) ,write('*')),nl, 
			   N3 is N2+1,
			   star1(N,N3).

% Combine star1,star0 to obtain 2N-1 lines of stars descending and then ascending.			   
star2(0).
star2(N) :- N > 0,
			star(N),
			N2 is N,
			star1(N2,2), 
			N2 is N-1,
			star(N2).
% Final result of star2(N).
% ***
% **
% *
% **
% ***

% ----------------- Question 3 -------------------
% Q3 - 1  
% Recursive predicate.

euclidsqr([],[],0).                                   % Base-case: It will stop when the lists are empty.
euclidsqr([X|Xs],[Y|Ys],ED) :- euclidsqr(Xs,Ys,ED1),  % it will go for the rest of the list.
		                       ED is ED1+(X-Y)*(X-Y). % storing in ED the sum of all computation of (X-Y)*(X-Y).
% Q3 - 2
% Tail recursive.
	
euclidsqr2([],[],0,0).
euclidsqr2([X|Xs],[Y|Ys],L,ED) :- euclidsqr2(Xs,Ys,L1,ED),
                                  L is L1+(X-Y)*(X-Y),
                                  ED is L.								  
		
% Q4 - 1

mem_rem(H, [H|T], T).
mem_rem(X, [H|T] , [H|L]) :- mem_rem(X,T,L).

% Q4 - 2

gen_n(0,_,[]).
gen_n(N,D,[X|Xs]) :- N>0,N1 is N-1,
                     mem_rem(X,D,D1),
					 gen_n(N1,D1,Xs).

gen4(L) :- gen_n(4,[1,2,3,4],L).

% Q4 - 3
% Check if head of two lists are different
% If at least one element is different, then the two lists are different in entries.

distinct_in_entries([],[]).                                        % Base-case: if the lists are empty then it will stop.
distinct_in_entries([X|Xs],[Y|Ys]) :- X =\= Y,                     % check if the head of the lists is different.
								      distinct_in_entries(Xs,Ys).  % recursive call for the rest of the list.


% ----------------- Question 4 -------------------								   
% Q4 - 4
% Generate 4 lists and then check if all four lists are different in entries.
% If they are different in entries then it is a possible solutiion.

gen_poss_soln([R1,R2,R3,R4]) :- gen4(R1),
								gen4(R2),
								gen4(R3),
								gen4(R4),
								distinct_in_entries(R1,R2),
								distinct_in_entries(R3,R2),
								distinct_in_entries(R4,R3),
								distinct_in_entries(R4,R1),
								distinct_in_entries(R3,R1),
								distinct_in_entries(R4,R2).

% Q4 - 5
% Generate a possible solution.
% Define the lists with members that have constraints.
% Define de constraints for the list members.

solve([R1,R2,R3,R4]) :- gen_poss_soln([R1,R2,R3,R4]),	
						R1 = [R11,R12,_,_],				
						R2 = [R21,R22,_,R24],
						R3 = [R31,R32,R33,R34],
						R4 = [_,_,R43,R44],
						R11 > R12,						
						R21 < R22,
						R24 > R34,
						R31 > R32,
						R33 < R34,
						R43 < R44.
		
% Q4 - 6   
% More efficient way for Question 4 - 5.
% 1 - generate list
% 2 - define the list with the members that have constraints
% 3 - define the constraints
% 4 - check if the lists are different in entries

solve_in_steps([R1,R2,R3,R4]) :- 
					gen4(R1),
					R1 = [R11,R12,_,_],
					R11 > R12,
					
					gen4(R2),
					R2 = [R21,R22,_,R24],
					R21 < R22,
					distinct_in_entries(R1,R2),
					gen4(R3),
					
					R3 = [R31,R32,R33,R34],
					R24 > R34,
					R31 > R32,
					R33 < R34,
					distinct_in_entries(R3,R2),
					distinct_in_entries(R3,R1),
					
					gen4(R4),
					R4 = [_,_,R43,R44],
					R43 < R44,
					distinct_in_entries(R4,R1),
					distinct_in_entries(R4,R2),
					distinct_in_entries(R4,R3).
					
					
					
					
					

								