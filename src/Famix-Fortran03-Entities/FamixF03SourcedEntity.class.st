"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FamixF03SourcedEntity',
	#superclass : 'FamixF03Entity',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : 'Famix-Fortran03-Entities-Entities',
	#package : 'Famix-Fortran03-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF03SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixF03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixF03SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixF03SourcedEntity
]
