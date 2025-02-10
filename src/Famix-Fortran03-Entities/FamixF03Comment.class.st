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
	#name : 'FamixF03Comment',
	#superclass : 'FamixF03SourcedEntity',
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : 'Famix-Fortran03-Entities-Entities',
	#package : 'Famix-Fortran03-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF03Comment class >> annotation [

	<FMClass: #Comment super: #FamixF03SourcedEntity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]
