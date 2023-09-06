Class {
	#name : #FamixFortranSourcedEntity,
	#superclass : #FamixFortranEntity,
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : #'Famix-FortranUDT-Entities-Entities'
}

{ #category : #meta }
FamixFortranSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixFortranEntity>
	<package: #'Famix-FortranUDT-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixFortranSourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixFortranSourcedEntity
]
