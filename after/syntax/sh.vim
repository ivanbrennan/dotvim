" Recognize functions nested within an { expression-list; }
syn cluster shExprList2 add=shFunctionOne,shFunctionTwo,shFunctionThree,shFunctionFour

" Allow { expression-list; } to fold
syn region shExpr transparent matchgroup=shExprRegion start="{" end="}" contains=@shExprList2 nextgroup=shSpecialNxt fold
