"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FamixFortranSourcedEntity',
	#superclass : 'FamixFortranEntity',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : 'Famix-FortranUDT-Entities-Entities',
	#package : 'Famix-FortranUDT-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixFortranSourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixFortranEntity>
	<package: #'Famix-FortranUDT-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixFortranSourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixFortranSourcedEntity
]
