"
a procedure
"
Class {
	#name : #FamixF77PUProcedure,
	#superclass : #FamixF77ProgramUnit,
	#traits : 'FamixTHasSignature + FamixTInvocable + FamixTWithAccesses + FamixTWithInvocations + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithStatements + FamixTWithTypes',
	#classTraits : 'FamixTHasSignature classTrait + FamixTInvocable classTrait + FamixTWithAccesses classTrait + FamixTWithInvocations classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithStatements classTrait + FamixTWithTypes classTrait',
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77PUProcedure class >> annotation [

	<FMClass: #PUProcedure super: #FamixF77ProgramUnit>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #testing }
FamixF77PUProcedure >> isInvocable [
	^true
]
