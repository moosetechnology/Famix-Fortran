"
a procedure
"
Class {
	#name : #FamixFortran77PUProcedure,
	#superclass : #FamixFortran77ProgramUnit,
	#traits : 'FamixTHasSignature + FamixTInvocable + FamixTWithAccesses + FamixTWithInvocations + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithStatements + FamixTWithTypes',
	#classTraits : 'FamixTHasSignature classTrait + FamixTInvocable classTrait + FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithStatements classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixFortran77PUProcedure class >> annotation [

	<FMClass: #PUProcedure super: #FamixFortran77ProgramUnit>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #testing }
FamixFortran77PUProcedure >> isInvocable [
	^true
]
