"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|



"
Class {
	#name : #FamixF77SourceAnchor,
	#superclass : #FamixF77Entity,
	#traits : 'FamixTSourceAnchor',
	#classTraits : 'FamixTSourceAnchor classTrait',
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77SourceAnchor class >> annotation [

	<FMClass: #SourceAnchor super: #FamixF77Entity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixF77SourceAnchor class >> isAbstract [

	<generated>
	^ self == FamixF77SourceAnchor
]
