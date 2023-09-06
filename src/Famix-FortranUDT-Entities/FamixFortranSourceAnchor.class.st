Class {
	#name : #FamixFortranSourceAnchor,
	#superclass : #FamixFortranEntity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-FortranUDT-Entities-Entities'
}

{ #category : #meta }
FamixFortranSourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FamixFortranEntity>
	<package: #'Famix-FortranUDT-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixFortranSourceAnchor class >> isAbstract [

	<generated>
	^ self == FamixFortranSourceAnchor
]
