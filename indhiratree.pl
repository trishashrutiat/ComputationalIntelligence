% Facts: parent relationships
parent(jawaharlal_nehru, indira_gandhi).
parent(kamala_nehru, indira_gandhi).
parent(indira_gandhi, rajiv_gandhi).
parent(indira_gandhi, sanjay_gandhi).
parent(rajiv_gandhi, rahul_gandhi).
parent(rajiv_gandhi, priyanka_gandhi).
parent(sonia_gandhi, rahul_gandhi).
parent(sonia_gandhi, priyanka_gandhi).
parent(sanjay_gandhi, varun_gandhi).
parent(maneka_gandhi, varun_gandhi).

% Rule: father relationship
father(X, Y) :- parent(X, Y), male(X).

% Rule: grandparent relationship
grandparent(X, Y) :- parent(X, Z), parent(Z, Y).

% Rule: grandchild relationship
grandchild(X, Y) :- grandparent(Y, X).

% Rule: sibling relationship
sibling(X, Y) :- parent(Z, X), parent(Z, Y), X \= Y.

% Rule: uncle/aunt relationship (an uncle is a brother of one parent)
uncle(X, Y) :- sibling(X, Z), parent(Z, Y), male(X).

% Rule: cousin relationship (cousins share a grandparent)
cousin(X, Y) :- grandparent(Z, X), grandparent(Z, Y), X \= Y.

% Spouse relationships
spouse(indira_gandhi, feroze_gandhi).
spouse(rajiv_gandhi, sonia_gandhi).
spouse(sanjay_gandhi, maneka_gandhi).

% Gender facts
male(jawaharlal_nehru).
male(feroze_gandhi).
male(rajiv_gandhi).
male(sanjay_gandhi).
male(rahul_gandhi).
male(varun_gandhi).

female(kamala_nehru).
female(indira_gandhi).
female(sonia_gandhi).
female(priyanka_gandhi).
female(maneka_gandhi).
