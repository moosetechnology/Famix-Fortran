Extension { #name : #FamixTWithStatements }

{ #category : #'*Famix-Fortran77-Entities-accessing' }
FamixTWithStatements >> statementFunctions [
	"Relation named: #statementFunctions type: #FamixF77StatementFunction opposite: #parentEntity"

	<generated>
	<FMComment: 'Statement functions defined in the body'>
	<derived>
	<FMProperty: #statementFunctions type: #FamixF77StatementFunction opposite: #parentEntity>
	<package: #'Famix-Fortran77-Entities'>
	^ self attributeAt: #statementFunctions ifAbsentPut: [ FMMultivalueLink on: self opposite: #parentEntity: ]
]

{ #category : #'*Famix-Fortran77-Entities-accessing' }
FamixTWithStatements >> statementFunctions: anObject [

	<generated>
	self statementFunctions value: anObject
]
