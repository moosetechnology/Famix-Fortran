"
Im a genuine program unit. I contains a statement
"
Class {
	#name : #FamixFortran03ProgramUnit,
	#superclass : #FamixFortran03AbstractProgramUnit,
	#traits : 'FamixTNamedEntity + FamixTWithLocalVariables + FamixTWithStatements + FamixTWithTypes',
	#classTraits : 'FamixTNamedEntity classTrait + FamixTWithLocalVariables classTrait + FamixTWithStatements classTrait + FamixTWithTypes classTrait',
	#instVars : [
		'#procedures => FMMany type: #FamixFortran03Procedure opposite: #programUnit',
		'#uses => FMMany type: #FamixFortran03Use opposite: #usedBy'
	],
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03ProgramUnit class >> annotation [

	<FMClass: #ProgramUnit super: #FamixFortran03AbstractProgramUnit>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixFortran03ProgramUnit >> addProcedure: anObject [
	<generated>
	^ self procedures add: anObject
]

{ #category : #adding }
FamixFortran03ProgramUnit >> addUse: anObject [
	<generated>
	^ self uses add: anObject
]

{ #category : #accessing }
FamixFortran03ProgramUnit >> procedures [
	"Relation named: #procedures type: #FamixFortran03Procedure opposite: #programUnit"

	<generated>
	<derived>
	^ procedures
]

{ #category : #accessing }
FamixFortran03ProgramUnit >> procedures: anObject [

	<generated>
	procedures value: anObject
]

{ #category : #navigation }
FamixFortran03ProgramUnit >> proceduresGroup [
	<generated>
	<navigation: 'Procedures'>
	^ MooseSpecializedGroup withAll: self procedures asSet
]

{ #category : #accessing }
FamixFortran03ProgramUnit >> uses [
	"Relation named: #uses type: #FamixFortran03Use opposite: #usedBy"

	<generated>
	<FMComment: 'All uses made by this programUnits'>
	<derived>
	^ uses
]

{ #category : #accessing }
FamixFortran03ProgramUnit >> uses: anObject [

	<generated>
	uses value: anObject
]
