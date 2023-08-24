"
includedFile
"
Class {
	#name : #FamixFortran77IncludedFile,
	#superclass : #FamixFortran77ProgramUnit,
	#traits : 'FamixTWithLocalVariables + FamixTWithTypes',
	#classTraits : 'FamixTWithLocalVariables classTrait + FamixTWithTypes classTrait',
	#instVars : [
		'#inclusions => FMMany type: #FamixFortran77Include opposite: #included'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixFortran77IncludedFile class >> annotation [

	<FMClass: #IncludedFile super: #FamixFortran77ProgramUnit>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixFortran77IncludedFile >> addInclusion: anObject [
	<generated>
	^ self inclusions add: anObject
]

{ #category : #accessing }
FamixFortran77IncludedFile >> inclusions [
	"Relation named: #inclusions type: #FamixFortran77Include opposite: #included"

	<generated>
	<FMComment: 'All inclusions of this file'>
	<derived>
	^ inclusions
]

{ #category : #accessing }
FamixFortran77IncludedFile >> inclusions: anObject [

	<generated>
	inclusions value: anObject
]
