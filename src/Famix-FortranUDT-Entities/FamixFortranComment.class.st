"
## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `commentedEntity` | `FamixTComment` | `comments` | `FamixTWithComments` | Source code commented by the comment|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `content` | `String` | nil | Content of the comment as a String|

"
Class {
	#name : 'FamixFortranComment',
	#superclass : 'FamixFortranSourcedEntity',
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : 'Famix-FortranUDT-Entities-Entities',
	#package : 'Famix-FortranUDT-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixFortranComment class >> annotation [

	<FMClass: #Comment super: #FamixFortranSourcedEntity>
	<package: #'Famix-FortranUDT-Entities'>
	<generated>
	^ self
]
