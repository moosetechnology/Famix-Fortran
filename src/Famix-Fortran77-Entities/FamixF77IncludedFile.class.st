"
includedFile
"
Class {
	#name : #FamixF77IncludedFile,
	#superclass : #FamixF77ProgramUnit,
	#traits : 'FamixTWithLocalVariables + FamixTWithTypes',
	#classTraits : 'FamixTWithLocalVariables classTrait + FamixTWithTypes classTrait',
	#instVars : [
		'#inclusions => FMMany type: #FamixF77Include opposite: #included'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77IncludedFile class >> annotation [

	<FMClass: #IncludedFile super: #FamixF77ProgramUnit>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixF77IncludedFile >> addInclusion: anObject [
	<generated>
	^ self inclusions add: anObject
]

{ #category : #accessing }
FamixF77IncludedFile >> inclusions [
	"Relation named: #inclusions type: #FamixF77Include opposite: #included"

	<generated>
	<FMComment: 'All inclusions of this file'>
	<derived>
	^ inclusions
]

{ #category : #accessing }
FamixF77IncludedFile >> inclusions: anObject [

	<generated>
	inclusions value: anObject
]
