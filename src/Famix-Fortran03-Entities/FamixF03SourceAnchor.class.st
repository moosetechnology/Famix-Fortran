"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|



"
Class {
	#name : 'FamixF03SourceAnchor',
	#superclass : 'FamixF03Entity',
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : 'Famix-Fortran03-Entities-Entities',
	#package : 'Famix-Fortran03-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF03SourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FamixF03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixF03SourceAnchor class >> isAbstract [

	<generated>
	^ self == FamixF03SourceAnchor
]
