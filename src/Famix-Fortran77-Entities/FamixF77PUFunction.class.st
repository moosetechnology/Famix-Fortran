"
a function procedure

## Relations
======================

### Other
| Relation | Origin | Opposite | Type | Comment |
| `declaredType` | `FamixTTypedEntity` | `typedEntities` | `FamixTType` | Type of the entity, if any|


## Properties
======================

| Name | Type | Default value | Comment |
| `isEsope` | `Boolean` | false | It is kind of esope function ?|

"
Class {
	#name : #FamixF77PUFunction,
	#superclass : #FamixF77PUProcedure,
	#traits : 'FamixTTypedEntity',
	#classTraits : 'FamixTTypedEntity classTrait',
	#instVars : [
		'#isEsope => FMProperty defaultValue: false'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77PUFunction class >> annotation [

	<FMClass: #PUFunction super: #FamixF77PUProcedure>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixF77PUFunction >> isEsope [

	<FMProperty: #isEsope type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'It is kind of esope function ?'>
	^ isEsope ifNil: [ isEsope := false ]
]

{ #category : #accessing }
FamixF77PUFunction >> isEsope: anObject [
	<generated>
	isEsope := anObject
]
