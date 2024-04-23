"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : #FamixF03NamedEntity,
	#superclass : #FamixF03Entity,
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixF03NamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixF03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixF03NamedEntity class >> isAbstract [

	<generated>
	^ self == FamixF03NamedEntity
]
