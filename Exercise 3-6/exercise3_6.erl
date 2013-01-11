-module (exercise3_6).

-export ([qsort/1]).
-export ([mergeSort/1]).

qsort([]) -> [];
qsort([X|Tail]) -> 
	More = qsort(moreBase(X, Tail)),
	Less = qsort(lessBase(X, Tail)),
	Less++[X]++More.

moreBase(_BaseEl, []) -> [];
moreBase(BaseEl, [X|Tail]) when X > BaseEl -> [X|moreBase(BaseEl, Tail)];
moreBase(BaseEl, [_X|Tail]) -> moreBase(BaseEl, Tail).

lessBase(_BaseEl, []) -> [];
lessBase(BaseEl, [X|Tail]) when X =< BaseEl -> [X|lessBase(BaseEl, Tail)];
lessBase(BaseEl, [_X|Tail]) -> lessBase(BaseEl, Tail).

mergeSort([]) -> [];
mergeSort([X|[]]) -> [X]; 
mergeSort(List) -> 
	Halfs = lists:split(length(List) div 2, List),
	LeftHalf = mergeSort(element(1, Halfs)),
	RightHalf = mergeSort(element(2, Halfs)),
	merge(LeftHalf, RightHalf).

merge([], []) -> [];
merge(List, []) -> List;
merge([], List) -> List;
merge([XL|TailL], [XR|TailR]) when XL > XR -> [XR|merge([XL|TailL], TailR)];
merge([XL|TailL], [XR|TailR]) -> [XL|merge(TailL, [XR|TailR])].