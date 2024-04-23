"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `element` | `FamixTSourceAnchor` | `sourceAnchor` | `FamixTSourceEntity` | Enable the accessibility to the famix entity that this class is a source pointer for|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `source` | `String` | nil | Actual source code of the source entity|

"
Class {
	#name : #FamixF03SourceTextAnchor,
	#superclass : #FamixF03SourceAnchor,
	#traits : 'FamixTHasImmediateSource',
	#classTraits : 'FamixTHasImmediateSource classTrait',
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixF03SourceTextAnchor class >> annotation [

	<FMClass: #SourceTextAnchor super: #FamixF03SourceAnchor>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]
