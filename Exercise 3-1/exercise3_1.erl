-module (exercise3_1).

-export ([sum/1]).
-export ([sum/2]).
-export ([test/0]).

sum(N) when is_integer(N), N > 0 -> sum(1, N).

sum(N, N) when is_integer(N) -> N;
sum(N, M) when is_integer(N), is_integer(M), N < M -> N + sum(N+1, M).

test() ->
	1 = sum(1),
	3 = sum(2),
	6 = sum(3),
	55 = sum(10),
	6 = sum(6,6),
	165 = sum(10, 20),
	15150 = sum(100, 200),
	ok.