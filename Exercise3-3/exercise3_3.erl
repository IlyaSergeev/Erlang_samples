-module (exercise3_3).

-export ([print/1]).

print(1) -> io:format("Number:~p~n", [1]);
print(N) when is_integer(N), N > 1 ->
	print(N-1),
	io:format("Number:~p~n", [N]).