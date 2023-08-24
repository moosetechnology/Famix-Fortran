"
Im an invocable subprogram. I may be either a Function or Subroutine. Im also can be an internal or external(In this case, replace me with a Module)
"
Class {
	#name : #FamixFortran03Procedure,
	#superclass : #FamixFortran03ProgramUnit,
	#traits : 'FamixTHasSignature + FamixTWithParameters',
	#classTraits : 'FamixTHasSignature classTrait + FamixTWithParameters classTrait',
	#instVars : [
		'#programUnit => FMOne type: #FamixFortran03ProgramUnit opposite: #procedures'
	],
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03Procedure class >> annotation [

	<FMClass: #Procedure super: #FamixFortran03ProgramUnit>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixFortran03Procedure >> programUnit [
	"Relation named: #programUnit type: #FamixFortran03ProgramUnit opposite: #procedures"

	<generated>
	<container>
	^ programUnit
]

{ #category : #accessing }
FamixFortran03Procedure >> programUnit: anObject [

	<generated>
	programUnit := anObject
]

{ #category : #navigation }
FamixFortran03Procedure >> programUnitGroup [
	<generated>
	<navigation: 'ProgramUnit'>
	^ MooseSpecializedGroup with: self programUnit
]
