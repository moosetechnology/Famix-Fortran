"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributes` | `FamixTWithAttributes` | `parentType` | `FamixTAttribute` | List of attributes declared by this type.|



"
Class {
	#name : 'FamixFortranUserDefinedType',
	#superclass : 'FamixF77Type',
	#traits : 'FamixTWithAttributes',
	#classTraits : 'FamixTWithAttributes classTrait',
	#category : 'Famix-FortranUDT-Entities-Entities',
	#package : 'Famix-FortranUDT-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixFortranUserDefinedType class >> annotation [

	<FMClass: #UserDefinedType super: #FamixF77Type>
	<package: #'Famix-FortranUDT-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixFortranUserDefinedType class >> isAbstract [

	<generated>
	^ self == FamixFortranUserDefinedType
]
