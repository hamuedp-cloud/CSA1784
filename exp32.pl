% Facts
person(john, 25).
person(mary, 30).
person(david, 22).

% Pattern Matching Rule
find_person(Name, Age) :-
    person(Name, Age).