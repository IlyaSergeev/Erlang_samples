-module (exercise3_4).

-export ([new/0]).
-export ([destroy/1]).
-export ([read/2]).
-export ([match/2]).
-export ([write/3]).
-export ([delete/2]).
-export ([test/0]).

new() -> [].
destroy(List) when is_list(List) -> ok.

read(_, []) -> {error, key_no_found};
read(Key, [{Key, Value}|_]) -> {ok, Value};
read(Key, [_|Tail]) -> read(Key, Tail).
	
match(_, []) -> [];
match(Element, [{Key, Element}|Tail]) -> [Key|match(Element, Tail)];
match(Element, [_|Tail]) -> match(Element, Tail).
	
write(Key, Element, Db) -> [{Key, Element}|delete(Key, Db)].
	
delete(_, []) -> [];
delete(Key, [{Key, _}|Tail]) -> Tail;
delete(Key, [Header|Tail]) -> [Header|delete(Key, Tail)].

test() ->
  [] = Db = new(),
  [{francesco,london}] = Db1 = write(francesco, london, Db),
  [{lelle,stockholm},{francesco,london}] = Db2 = write(lelle, stockholm, Db1),
  {ok,london} = read(francesco, Db2),
  [{joern,stockholm},{lelle,stockholm},{francesco,london}] = Db3 = write(joern, stockholm, Db2),
  {error,key_no_found}= read(ola, Db3),
  [joern,lelle] = match(stockholm, Db3),
  [{joern,stockholm},{francesco,london}] = Db4 = delete(lelle, Db3),
  [{francesco,prague},{joern,stockholm}] = write(francesco, prague, Db4),
  [joern] = match(stockholm, Db4),
  ok.