"
## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixF77NamedEntity',
	#superclass : 'FamixF77Entity',
	#traits : 'FamixTNamedEntity',
	#classTraits : 'FamixTNamedEntity classTrait',
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77NamedEntity class >> annotation [

	<FMClass: #NamedEntity super: #FamixF77Entity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixF77NamedEntity class >> isAbstract [

	<generated>
	^ self == FamixF77NamedEntity
]

{ #category : 'testing' }
FamixF77NamedEntity >> isNamedEntity [

	<generated>
	^ true
]
