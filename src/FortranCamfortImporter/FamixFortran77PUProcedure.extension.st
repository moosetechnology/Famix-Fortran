Extension { #name : #FamixFortran77PUProcedure }

{ #category : #'*FortranCamfortImporter' }
FamixFortran77PUProcedure >> allLocalVariables [

	self flag: #FIXME. "Find better way to flatmap types"
	^ self localVariables
	  ,
		  (self includes collect: [ :include | 
			   include included localVariables ]) flattened
]

{ #category : #'*FortranCamfortImporter' }
FamixFortran77PUProcedure >> allTypes [

	self flag: #FIXME. "Find better way to flatmap types"
	^ self types
	  , (self includes collect: [ :include | include included types ])
			  flattened
]