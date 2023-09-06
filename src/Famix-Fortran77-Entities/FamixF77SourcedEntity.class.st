Class {
	#name : #FamixF77SourcedEntity,
	#superclass : #FamixF77Entity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixF77Entity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixF77SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixF77SourcedEntity
]
