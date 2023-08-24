Class {
	#name : #FamixFortran03SourcedEntity,
	#superclass : #FamixFortran03Entity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixFortran03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixFortran03SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixFortran03SourcedEntity
]
