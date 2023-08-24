"
a program unit
"
Class {
	#name : #FamixFortran77ProgramUnit,
	#superclass : #FamixFortran77NamedEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#includes => FMMany type: #FamixFortran77Include opposite: #includedBy',
		'#programFile => FMOne type: #FamixFortran77ProgramFile opposite: #programUnits'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixFortran77ProgramUnit class >> annotation [

	<FMClass: #ProgramUnit super: #FamixFortran77NamedEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixFortran77ProgramUnit >> addInclude: anObject [
	<generated>
	^ self includes add: anObject
]

{ #category : #implicit }
FamixFortran77ProgramUnit >> defaultImplicit [

	^ (($a to: $z) collect: [ :char | 
		   ('ijklmn' includes: char)
			   ifTrue:  [ char -> #integer ]
			   ifFalse: [ char -> #real ] ]) asDictionary
]

{ #category : #accessing }
FamixFortran77ProgramUnit >> dicImplicit [

	^ self attributeAt: #dicImplicit ifAbsentPut: [ self defaultImplicit ]
]

{ #category : #testing }
FamixFortran77ProgramUnit >> implicits [

	^ self attributeAt: #implicits ifAbsent: [  ]
]

{ #category : #accessing }
FamixFortran77ProgramUnit >> includes [
	"Relation named: #includes type: #FamixFortran77Include opposite: #includedBy"

	<generated>
	<FMComment: 'All inclusions made by this programUnits'>
	<derived>
	^ includes
]

{ #category : #accessing }
FamixFortran77ProgramUnit >> includes: anObject [

	<generated>
	includes value: anObject
]

{ #category : #testing }
FamixFortran77ProgramUnit >> isInvocable [
	^false
]

{ #category : #accessing }
FamixFortran77ProgramUnit >> programFile [
	"Relation named: #programFile type: #FamixFortran77ProgramFile opposite: #programUnits"

	<generated>
	<container>
	^ programFile
]

{ #category : #accessing }
FamixFortran77ProgramUnit >> programFile: anObject [

	<generated>
	programFile := anObject
]

{ #category : #navigation }
FamixFortran77ProgramUnit >> programFileGroup [
	<generated>
	<navigation: 'ProgramFile'>
	^ MooseSpecializedGroup with: self programFile
]

{ #category : #accessing }
FamixFortran77ProgramUnit >> symbolTable [

	^ self attributeAt: #symbolTable ifAbsentPut: [ Dictionary new ]
]
