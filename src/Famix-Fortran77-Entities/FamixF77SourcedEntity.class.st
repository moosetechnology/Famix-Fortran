"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FamixF77SourcedEntity',
	#superclass : 'FamixF77Entity',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77SourcedEntity class >> annotation [

	<FMClass: #SourcedEntity super: #FamixF77Entity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixF77SourcedEntity class >> isAbstract [

	<generated>
	^ self == FamixF77SourcedEntity
]
