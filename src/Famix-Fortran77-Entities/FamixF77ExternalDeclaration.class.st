"
Im a external declaration. 
	[See more](https://docs.oracle.com/cd/E19957-01/805-4939/6j4m0vn9d/index.html)
"
Class {
	#name : #FamixF77ExternalDeclaration,
	#superclass : #FamixF77NamedEntity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#instVars : [
		'#programUnit => FMOne type: #FamixF77ProgramUnit opposite: #externalDeclarations'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77ExternalDeclaration class >> annotation [

	<FMClass: #ExternalDeclaration super: #FamixF77NamedEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixF77ExternalDeclaration >> programUnit [
	"Relation named: #programUnit type: #FamixF77ProgramUnit opposite: #externalDeclarations"

	<generated>
	<container>
	^ programUnit
]

{ #category : #accessing }
FamixF77ExternalDeclaration >> programUnit: anObject [

	<generated>
	programUnit := anObject
]

{ #category : #navigation }
FamixF77ExternalDeclaration >> programUnitGroup [
	<generated>
	<navigation: 'ProgramUnit'>
	^ MooseSpecializedGroup with: self programUnit
]
