"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : #FamixF03SourceLanguage,
	#superclass : #FamixF03Entity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixF03SourceLanguage class >> annotation [

	<FMClass: #SourceLanguage super: #FamixF03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]
