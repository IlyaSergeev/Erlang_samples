-module (exercise3_7).

-export ([new/0]).
-export ([destroy/1]).
-export ([read/2]).
-export ([match/2]).
-export ([write/3]).
-export ([delete/2]).
-export ([test/0]).

new() -> [].

destroy(_) -> [].

write(Key, Element, Db) -> lists:append(Db, [{Key, Element}]).

delete(_, []) -> [];

delete(Key, Db) -> lists:keydelete(Key, 1, Db).

read(_, []) -> [];

read(Key, Db) -> lists:keysearch(Key, 1, Db).

match(_, []) -> [];

match(Element, Db) -> lists:keysearch(Element, 2, Db).

test() ->
	[] = Db = new(),
 	[{francesco,london}] = Db1 = write(francesco, london, Db),
  	[{francesco,london},{lelle,stockholm}] = Db2 = write(lelle, stockholm, Db1),
  	{value,{francesco,london}} = read(francesco, Db2),
  	[{francesco,london},{lelle,stockholm},{joern,stockholm}] = Db3 = write(joern, stockholm, Db2),
  	false = read(ola, Db3),
	{value,{lelle,stockholm}} = match(stockholm, Db3),
	Db4 = delete(lelle, Db3),
  	[{francesco,london},{joern,stockholm}] = Db4,
  	[{francesco,london},{joern,stockholm},{francesco,prague}] = write(francesco, prague, Db4),
  	{value,{joern,stockholm}} = match(stockholm, Db4),
  ok.