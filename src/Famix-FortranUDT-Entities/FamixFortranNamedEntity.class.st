Class {
	#name : #FamixFortranNamedEntity,
	#superclass : #FamixFortranEntity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'Famix-FortranUDT-Entities-Entities'
}

{ #category : #meta }
FamixFortranNamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixFortranEntity>
	<package: #'Famix-FortranUDT-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixFortranNamedEntity class >> isAbstract [

	<generated>
	^ self == FamixFortranNamedEntity
]
