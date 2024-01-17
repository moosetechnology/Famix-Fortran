"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : #FamixF77UnknownSourceLanguage,
	#superclass : #FamixF77SourceLanguage,
	#traits : 'FamixTUnknownSourceLanguage',
	#classTraits : 'FamixTUnknownSourceLanguage classTrait',
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77UnknownSourceLanguage class >> annotation [

	<FMClass: #UnknownSourceLanguage super: #FamixF77SourceLanguage>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]
