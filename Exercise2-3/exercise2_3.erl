-module (exercise2_3).

-export ([b_not/1]).
-export ([b_and/2]).
-export ([b_nand/2]).
-export ([b_or/2]).
-export ([test/0]).

b_not(true) -> false;
b_not(false) -> true.

b_and(true, true) -> true;
b_and(Arg1, Arg2) when is_boolean(Arg1), is_boolean(Arg2) -> false.

b_nand(Arg1, Arg2) -> b_not(b_and(Arg1, Arg2)).

b_or(false, false) -> false;
b_or(Arg1, Arg2) when is_boolean(Arg1), is_boolean(Arg2) -> true.

test() ->
	true = b_not(false),
	false = b_not(true),
	true = b_and(true, true),
	false = b_and(false, true),
	false = b_and(true, false),
	false = b_and(false, false),
	true = b_nand(false, false),
	true = b_nand(false, true),
	true = b_nand(true, false),
	false = b_nand(true, true),
	false = b_or(false, false),
	true = b_or(false, true),
	true = b_or(true, false),
	true = b_or(true, true),
	ok.
	