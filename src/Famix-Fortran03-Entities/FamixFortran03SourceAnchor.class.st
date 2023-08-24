Class {
	#name : #FamixFortran03SourceAnchor,
	#superclass : #FamixFortran03Entity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03SourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FamixFortran03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixFortran03SourceAnchor class >> isAbstract [

	<generated>
	^ self == FamixFortran03SourceAnchor
]
