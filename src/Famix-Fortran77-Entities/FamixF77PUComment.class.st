"
a comment belongs to fortran file

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `commentedEntity` | `FamixTComment` | `comments` | `FamixTWithComments` | Source code commented by the comment|


## Properties
======================

| Name | Type | Default value | Comment |
| `content` | `String` | nil | Content of the comment as a String|

"
Class {
	#name : #FamixF77PUComment,
	#superclass : #FamixF77ProgramUnit,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77PUComment class >> annotation [

	<FMClass: #PUComment super: #FamixF77ProgramUnit>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]
