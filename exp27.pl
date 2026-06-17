% Graph edges with costs
edge(0,1,3).
edge(0,2,6).
edge(0,3,5).
edge(1,4,9).
edge(1,5,8).
edge(2,6,12).
edge(2,7,14).
edge(3,8,7).
edge(8,9,5).
edge(8,10,6).
edge(9,11,1).
edge(9,12,10).
edge(9,13,2).

% Undirected graph
connected(X,Y,C) :- edge(X,Y,C).
connected(X,Y,C) :- edge(Y,X,C).

% Best First Search
bestfs(Goal, [Goal|_], _) :-
    write('Goal Found: '), write(Goal), nl.

bestfs(Goal, [Current|Rest], Visited) :-
    findall((Cost,Next),
            (connected(Current,Next,Cost),
             \+ member(Next,Visited)),
            Children),
    sort(Children, Sorted),
    extract_nodes(Sorted, Nodes),
    append(Rest, Nodes, Queue),
    bestfs(Goal, Queue, [Current|Visited]).

extract_nodes([], []).
extract_nodes([(_,X)|T], [X|R]) :-
    extract_nodes(T, R).

% Start predicate
start :-
    bestfs(9, [0], []).