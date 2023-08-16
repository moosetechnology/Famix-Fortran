Class {
	#name : #FamixFortran03NamedEntity,
	#superclass : #FamixFortran03Entity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03NamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixFortran03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixFortran03NamedEntity class >> isAbstract [

	<generated>
	^ self == FamixFortran03NamedEntity
]
