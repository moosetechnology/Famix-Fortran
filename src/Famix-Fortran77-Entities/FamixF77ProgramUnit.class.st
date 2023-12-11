"
a program unit
"
Class {
	#name : #FamixF77ProgramUnit,
	#superclass : #FamixF77NamedEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#externalDeclarations => FMMany type: #FamixF77ExternalDeclaration opposite: #programUnit',
		'#includes => FMMany type: #FamixF77Include opposite: #includedBy',
		'#programFile => FMOne type: #FamixF77ProgramFile opposite: #programUnits'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77ProgramUnit class >> annotation [

	<FMClass: #ProgramUnit super: #FamixF77NamedEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixF77ProgramUnit class >> isAbstract [

	<generated>
	^ self == FamixF77ProgramUnit
]

{ #category : #adding }
FamixF77ProgramUnit >> addExternalDeclaration: anObject [
	<generated>
	^ self externalDeclarations add: anObject
]

{ #category : #adding }
FamixF77ProgramUnit >> addInclude: anObject [
	<generated>
	^ self includes add: anObject
]

{ #category : #implicit }
FamixF77ProgramUnit >> defaultImplicit [

	^ (($a to: $z) collect: [ :char | 
		   ('ijklmn' includes: char)
			   ifTrue:  [ char -> #integer ]
			   ifFalse: [ char -> #real ] ]) asDictionary
]

{ #category : #accessing }
FamixF77ProgramUnit >> dicImplicit [

	^ self attributeAt: #dicImplicit ifAbsentPut: [ self defaultImplicit ]
]

{ #category : #accessing }
FamixF77ProgramUnit >> externalDeclarations [
	"Relation named: #externalDeclarations type: #FamixF77ExternalDeclaration opposite: #programUnit"

	<generated>
	<derived>
	^ externalDeclarations
]

{ #category : #accessing }
FamixF77ProgramUnit >> externalDeclarations: anObject [

	<generated>
	externalDeclarations value: anObject
]

{ #category : #navigation }
FamixF77ProgramUnit >> externalDeclarationsGroup [
	<generated>
	<navigation: 'ExternalDeclarations'>
	^ MooseSpecializedGroup withAll: self externalDeclarations asSet
]

{ #category : #testing }
FamixF77ProgramUnit >> implicits [

	^ self attributeAt: #implicits ifAbsent: [  ]
]

{ #category : #accessing }
FamixF77ProgramUnit >> includes [
	"Relation named: #includes type: #FamixF77Include opposite: #includedBy"

	<generated>
	<FMComment: 'All inclusions made by this programUnits'>
	<derived>
	^ includes
]

{ #category : #accessing }
FamixF77ProgramUnit >> includes: anObject [

	<generated>
	includes value: anObject
]

{ #category : #testing }
FamixF77ProgramUnit >> isInvocable [
	^false
]

{ #category : #accessing }
FamixF77ProgramUnit >> programFile [
	"Relation named: #programFile type: #FamixF77ProgramFile opposite: #programUnits"

	<generated>
	<container>
	^ programFile
]

{ #category : #accessing }
FamixF77ProgramUnit >> programFile: anObject [

	<generated>
	programFile := anObject
]

{ #category : #navigation }
FamixF77ProgramUnit >> programFileGroup [
	<generated>
	<navigation: 'ProgramFile'>
	^ MooseSpecializedGroup with: self programFile
]

{ #category : #accessing }
FamixF77ProgramUnit >> symbolTable [

	^ self attributeAt: #symbolTable ifAbsentPut: [ Dictionary new ]
]
