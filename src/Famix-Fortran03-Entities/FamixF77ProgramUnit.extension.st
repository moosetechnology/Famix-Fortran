Extension { #name : 'FamixF77ProgramUnit' }

{ #category : '*Famix-Fortran03-Entities-accessing' }
FamixF77ProgramUnit >> uses [
	"Relation named: #uses type: #FamixF03Use opposite: #usedBy"

	<generated>
	<FMComment: 'All uses made by this programUnits'>
	<derived>
	<FMProperty: #uses type: #FamixF03Use opposite: #usedBy>
	<package: #'Famix-Fortran03-Entities'>
	^ self attributeAt: #uses ifAbsentPut: [ FMMultivalueLink on: self opposite: #usedBy: ]
]

{ #category : '*Famix-Fortran03-Entities-accessing' }
FamixF77ProgramUnit >> uses: anObject [

	<generated>
	self uses value: anObject
]
