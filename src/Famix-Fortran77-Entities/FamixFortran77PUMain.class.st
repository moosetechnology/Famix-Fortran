"
a main program
"
Class {
	#name : #FamixFortran77PUMain,
	#superclass : #FamixFortran77ProgramUnit,
	#traits : 'FamixTWithAccesses + FamixTWithInvocations + FamixTWithLocalVariables + FamixTWithStatements + FamixTWithTypes',
	#classTraits : 'FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FamixTWithLocalVariables classTrait + FamixTWithStatements classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixFortran77PUMain class >> annotation [

	<FMClass: #PUMain super: #FamixFortran77ProgramUnit>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]
