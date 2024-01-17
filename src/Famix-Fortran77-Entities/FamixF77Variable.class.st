"
a local variable of a program unit

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
| `parentBehaviouralEntity` | `FamixTLocalVariable` | `localVariables` | `FamixTWithLocalVariables` | Behavioural entity declaring this local variable. belongsTo implementation|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
| `incomingAccesses` | `FamixTAccessible` | `variable` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
| `declaredType` | `FamixTTypedEntity` | `typedEntities` | `FamixTType` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
| `isEsope` | `Boolean` | false | It is esope attribute variable from segment definition ?|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|
| `segment` | `String` | nil | variable belong to this segment|

"
Class {
	#name : #FamixF77Variable,
	#superclass : #FamixF77Entity,
	#traits : 'FamixTLocalVariable',
	#classTraits : 'FamixTLocalVariable classTrait',
	#instVars : [
		'#isEsope => FMProperty defaultValue: false',
		'#segment => FMProperty'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77Variable class >> annotation [

	<FMClass: #Variable super: #FamixF77Entity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixF77Variable >> isEsope [

	<FMProperty: #isEsope type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'It is esope attribute variable from segment definition ?'>
	^ isEsope ifNil: [ isEsope := false ]
]

{ #category : #accessing }
FamixF77Variable >> isEsope: anObject [
	<generated>
	isEsope := anObject
]

{ #category : #accessing }
FamixF77Variable >> segment [

	<FMProperty: #segment type: #String>
	<generated>
	<FMComment: 'variable belong to this segment'>
	^ segment
]

{ #category : #accessing }
FamixF77Variable >> segment: anObject [
	<generated>
	segment := anObject
]
