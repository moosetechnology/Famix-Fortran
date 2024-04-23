"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `attributes` | `FamixFortranUserDefinedType` | `userDefinedType` | `FamixFortranAttribute` | |



"
Class {
	#name : #FamixFortranUserDefinedType,
	#superclass : #FamixF77Type,
	#instVars : [
		'#attributes => FMMany type: #FamixFortranAttribute opposite: #userDefinedType'
	],
	#category : #'Famix-FortranUDT-Entities-Entities'
}

{ #category : #meta }
FamixFortranUserDefinedType class >> annotation [

	<FMClass: #UserDefinedType super: #FamixF77Type>
	<package: #'Famix-FortranUDT-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixFortranUserDefinedType class >> isAbstract [

	<generated>
	^ self == FamixFortranUserDefinedType
]

{ #category : #adding }
FamixFortranUserDefinedType >> addAttribute: anObject [
	<generated>
	^ self attributes add: anObject
]

{ #category : #accessing }
FamixFortranUserDefinedType >> attributes [
	"Relation named: #attributes type: #FamixFortranAttribute opposite: #userDefinedType"

	<generated>
	<derived>
	^ attributes
]

{ #category : #accessing }
FamixFortranUserDefinedType >> attributes: anObject [

	<generated>
	attributes value: anObject
]

{ #category : #navigation }
FamixFortranUserDefinedType >> attributesGroup [
	<generated>
	<navigation: 'Attributes'>
	^ MooseSpecializedGroup withAll: self attributes asSet
]
