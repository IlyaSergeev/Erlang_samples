-module (exercise3_5).

-export ([filter/2]).
-export ([reverse/1]).
-export ([concat/1]).
-export ([concatLists/2]).
-export ([flatten/1]).
-export ([test/0]).

filter([], _N) -> [];
filter([X|Tail], N) when X > N -> filter(Tail, N);
filter([X|Tail], N) -> [X|filter(Tail, N)].

reverse(List) -> reverse(List, []).

reverse([H|T], Acc) -> reverse(T, [H|Acc]);
reverse([], Acc) -> Acc.

concat([]) -> [];
concat([List|Tail]) -> concatLists(List, concat(Tail)).

concatLists([], []) -> [];
concatLists([], SrcList) -> SrcList;
concatLists([X|Tail], SrcList) -> [X|concatLists(Tail, SrcList)].

flatten([]) -> [];
flatten([X|Tail]) when is_list(X) -> concatLists(flatten(X), flatten(Tail));
flatten([X|Tail]) -> [X|flatten(Tail)].

test() ->
	[1, 2, 3] = filter([1, 2, 3, 4, 5, 6], 3),
	[1, 2, 3, 4] = filter([1, 2, 3, 4], 10),
	[6, 5, 4, 3, 2, 1] = reverse([1, 2, 3, 4, 5, 6]),
	[1, 2, 3, 4, 5, 6, 7, 8, 9] = concat([[1, 2, 3], [4, 5], [6], [], [7, 8, 9]]),
	[1, 2, 3, 4, 5, 6, 7, 8, 9, 10] = flatten([[1, 2, 3], [], [[4, 5], [6, 7, 8], [[[9], 10]]]]),
	ok.