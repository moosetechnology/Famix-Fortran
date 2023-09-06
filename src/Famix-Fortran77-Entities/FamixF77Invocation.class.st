"
an invocation of procedure inside a procedure or main program
"
Class {
	#name : #FamixF77Invocation,
	#superclass : #FamixF77Entity,
	#traits : 'FamixTInvocation + TEntityMetaLevelDependency',
	#classTraits : 'FamixTInvocation classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77Invocation class >> annotation [

	<FMClass: #Invocation super: #FamixF77Entity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]
