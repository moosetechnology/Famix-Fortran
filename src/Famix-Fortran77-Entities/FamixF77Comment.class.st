"
a fortran comment

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `commentedEntity` | `FamixTComment` | `comments` | `FamixTWithComments` | Source code commented by the comment|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isEsope` | `Boolean` | false | Is it an esope comment ?|

"
Class {
	#name : 'FamixF77Comment',
	#superclass : 'FamixF77SourcedEntity',
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#instVars : [
		'#isEsope => FMProperty defaultValue: false'
	],
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77Comment class >> annotation [

	<FMClass: #Comment super: #FamixF77SourcedEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixF77Comment >> isEsope [

	<FMProperty: #isEsope type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'Is it an esope comment ?'>
	^ isEsope ifNil: [ isEsope := false ]
]

{ #category : 'accessing' }
FamixF77Comment >> isEsope: anObject [
	<generated>
	isEsope := anObject
]
