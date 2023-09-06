Class {
	#name : #FamixF03SourceAnchor,
	#superclass : #FamixF03Entity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixF03SourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FamixF03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixF03SourceAnchor class >> isAbstract [

	<generated>
	^ self == FamixF03SourceAnchor
]
