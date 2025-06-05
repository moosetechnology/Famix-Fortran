"
a function procedure

## Relations
======================

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typing` | `FamixTTypedEntity` | `typedEntity` | `FamixTEntityTyping` | Association linking this entity to its declared type.|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isEsope` | `Boolean` | false | Is it an Esope function (segini,...) ?|

"
Class {
	#name : 'FamixF77PUFunction',
	#superclass : 'FamixF77PUProcedure',
	#traits : 'FamixTTypedEntity',
	#classTraits : 'FamixTTypedEntity classTrait',
	#instVars : [
		'#isEsope => FMProperty defaultValue: false'
	],
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77PUFunction class >> annotation [

	<FMClass: #PUFunction super: #FamixF77PUProcedure>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixF77PUFunction >> isEsope [

	<FMProperty: #isEsope type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'Is it an Esope function (segini,...) ?'>
	^ isEsope ifNil: [ isEsope := false ]
]

{ #category : 'accessing' }
FamixF77PUFunction >> isEsope: anObject [
	<generated>
	isEsope := anObject
]
