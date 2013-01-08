-module (exercise3_3).

-export ([print/1]).
-export ([print_even/1]).

print(1) -> io:format("Number:~p~n", [1]);
print(N) when is_integer(N), N > 1 ->
	print(N-1),
	io:format("Number:~p~n", [N]).
	
print_even(1) -> ok;
print_even(2) -> io:format("Number:~p~n", [2]);
print_even(N) when is_integer(N), N rem 2 == 0 ->
	print_even(N-2),
	io:format("Number:~p~n", [N]);
print_even(N) when is_integer(N) -> print(N-1).