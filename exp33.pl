% Check whether a character is a vowel
vowel(a).
vowel(e).
vowel(i).
vowel(o).
vowel(u).

% Base case
count_vowels([], 0).

% If head is a vowel
count_vowels([H|T], Count) :-
    vowel(H),
    count_vowels(T, Rest),
    Count is Rest + 1.

% If head is not a vowel
count_vowels([H|T], Count) :-
    \+ vowel(H),
    count_vowels(T, Count).