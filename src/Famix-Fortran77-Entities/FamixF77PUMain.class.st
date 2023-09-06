"
a main program
"
Class {
	#name : #FamixF77PUMain,
	#superclass : #FamixF77ProgramUnit,
	#traits : 'FamixTWithAccesses + FamixTWithInvocations + FamixTWithLocalVariables + FamixTWithStatements + FamixTWithTypes',
	#classTraits : 'FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FamixTWithLocalVariables classTrait + FamixTWithStatements classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77PUMain class >> annotation [

	<FMClass: #PUMain super: #FamixF77ProgramUnit>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]
