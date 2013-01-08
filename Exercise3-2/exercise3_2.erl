-module (exercise3_2).

-export ([create/1]).
-export ([create_reverse/1]).
-export ([test/0]).

create(N) when is_integer(N), N > 0 -> create(N, []). 

create(N, ResultList) when N > 0 -> create(N-1, [N|ResultList]);
create(_, ResultList) -> ResultList.

create_reverse(1) -> [1];
create_reverse(N) when is_integer(N), N > 0 -> [N|create_reverse(N-1)].

test() ->
	[1, 2, 3, 4, 5] = create(5),
	[1, 2, 3] = create(3),
	[1] = create(1),
	[1] = create_reverse(1),
	[4, 3, 2, 1] = create_reverse(4),
	[6, 5, 4, 3, 2, 1] = create_reverse(6),
	ok.