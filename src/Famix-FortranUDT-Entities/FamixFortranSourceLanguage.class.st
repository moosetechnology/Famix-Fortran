"
## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourcedEntities` | `FamixTSourceLanguage` | `declaredSourceLanguage` | `FamixTWithSourceLanguages` | References to the entities saying explicitly that are written in this language.|



"
Class {
	#name : 'FamixFortranSourceLanguage',
	#superclass : 'FamixFortranEntity',
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : 'Famix-FortranUDT-Entities-Entities',
	#package : 'Famix-FortranUDT-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixFortranSourceLanguage class >> annotation [

	<FMClass: #SourceLanguage super: #FamixFortranEntity>
	<package: #'Famix-FortranUDT-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixFortranSourceLanguage >> name [

	<FMProperty: #name type: #String> 
	<derived>
	<FMComment: 'The name of the language'>
	
	^'Fortran'
]
