-module (exercise3_6).

-export ([qsort/1]).
-export ([mergeSort/1]).
-export ([test/0]).

qsort([]) -> [];
qsort([BaseEl|Tail]) -> 
	{Less, More} = separate(BaseEl, Tail),
	qsort(Less) ++ [BaseEl] ++ qsort(More).
	
separate(_BaseEl, []) -> {[], []};
separate(BaseEl, [X|Tail]) ->
	{Less, More} = separate(BaseEl, Tail),
	case X > BaseEl of
		true -> {Less, [X|More]};
		false -> {[X|Less], More}
	end.

mergeSort([]) -> [];
mergeSort([X|[]]) -> [X]; 
mergeSort(List) -> 
	{LeftHalf, RightHalf} = lists:split(length(List) div 2, List),
	merge(mergeSort(LeftHalf), mergeSort(RightHalf)).

merge([], []) -> [];
merge(List, []) -> List;
merge([], List) -> List;
merge([XL|TailL], [XR|TailR]) ->
	case XL > XR of
		true -> [XR|merge([XL|TailL], TailR)];
		false -> [XL|merge(TailL, [XR|TailR])]
	end.

test() ->
	[] = qsort([]),
	[0,1,2,3,4,5,6,7,8,9] = qsort([5,4,7,9,1,2,0,3,6,8]),
	[1,1,1,2,2,2,3,3] = qsort([1,2,3,2,2,1,1,3]),
	[] = mergeSort([]),
	[0,1,2,3,4,5,6,7,8,9] = mergeSort([5,4,7,9,1,2,0,3,6,8]),
	[1,1,1,2,2,2,3,3] = mergeSort([1,2,3,2,2,1,1,3]),
	ok.