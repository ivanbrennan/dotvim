" Recognize functions nested within an { expression-group; }
syn cluster shExprList2 add=shFunctionOne,shFunctionTwo,shFunctionThree,shFunctionFour

" Allow { expression-group; } to fold
syn region shExpr transparent matchgroup=shExprRegion start="{" end="}" contains=@shExprList2 nextgroup=shSpecialNxt fold
