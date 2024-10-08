% Check if an element is a member of a set
member(X, [X|_]).  % X is a member if it is the head of the list
member(X, [_|Tail]) :- member(X, Tail).  % Recursively check the tail

% Union of two sets
union([], L, L).  % The union of an empty set and L is L
union([H|T], L, Union) :- 
    member(H, L),  % If H is already a member of L
    union(T, L, Union).  % Continue with the tail
union([H|T], L, [H|Union]) :- 
    \+ member(H, L),  % If H is not a member of L
    union(T, L, Union).  % Include H in the union

% Intersection of two sets
intersection([], _, []).  % The intersection of an empty set is empty
intersection([H|T], L, [H|Inter]) :- 
    member(H, L),  % H is in both sets
    intersection(T, L, Inter).  % Continue with the tail
intersection([H|T], L, Inter) :- 
    \+ member(H, L),  % H is not in L
    intersection(T, L, Inter).  % Continue with the tail

% Difference of two sets
difference([], _, []).  % The difference with an empty set is empty
difference([H|T], L, [H|Diff]) :- 
    \+ member(H, L),  % H is not in L
    difference(T, L, Diff).  % Continue with the tail
difference([H|T], L, Diff) :- 
    member(H, L),  % H is in L
    difference(T, L, Diff).  % Continue with the tail

% Check if one set is a subset of another
subset([], _).  % The empty set is a subset of any set
subset([H|T], L) :- 
    member(H, L),  % H must be a member of L
    subset(T, L).  % Continue checking the tail

% Calculate the cardinality (size) of a set
cardinality(Set, Cardinality) :- 
    remove_duplicates(Set, UniqueSet),  % Remove duplicates first
    length(UniqueSet, Cardinality).  % Get the length of the unique set

% Remove duplicates from a list
remove_duplicates([], []).  % Base case for removing duplicates
remove_duplicates([H|T], Unique) :- 
    member(H, T),  % If H is a member of the tail
    remove_duplicates(T, Unique).  % Skip H and continue
remove_duplicates([H|T], [H|Unique]) :- 
    \+ member(H, T),  % If H is not in the tail
    remove_duplicates(T, Unique).  % Include H and continue


















% Membership
?- member(2, [1, 2, 3]).
true.

% Union
?- union([1, 2, 3], [3, 4, 5], Result).
Result = [1, 2, 3, 4, 5].

% Intersection
?- intersection([1, 2, 3], [2, 3, 4], Inter).
Inter = [2, 3].

% Difference
?- difference([1, 2, 3], [2, 3, 4], Diff).
Diff = [1].

% Subset
?- subset([1, 2], [1, 2, 3]).
true.

% Cardinality
?- cardinality([1, 2, 2, 3], C).
C = 3.
