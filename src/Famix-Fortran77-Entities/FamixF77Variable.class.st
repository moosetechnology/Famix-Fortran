"
a local variable of a program unit

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBehaviouralEntity` | `FamixTLocalVariable` | `localVariables` | `FamixTWithLocalVariables` | Behavioural entity declaring this local variable. belongsTo implementation|
| `parentCommonBlock` | `FamixF77Variable` | `variables` | `FamixF77CommonBlock` | |

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typing` | `FamixTTypedEntity` | `typedEntity` | `FamixTEntityTyping` | Association linking this entity to its declared type.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingAccesses` | `FamixTAccessible` | `variable` | `FamixTAccess` | All Famix accesses pointing to this structural entity|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixF77Variable',
	#superclass : 'FamixF77StructuralEntity',
	#traits : 'FamixTLocalVariable',
	#classTraits : 'FamixTLocalVariable classTrait',
	#instVars : [
		'#parentCommonBlock => FMOne type: #FamixF77CommonBlock opposite: #variables'
	],
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77Variable class >> annotation [

	<FMClass: #Variable super: #FamixF77StructuralEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixF77Variable >> parentCommonBlock [
	"Relation named: #parentCommonBlock type: #FamixF77CommonBlock opposite: #variables"

	<generated>
	<container>
	^ parentCommonBlock
]

{ #category : 'accessing' }
FamixF77Variable >> parentCommonBlock: anObject [

	<generated>
	parentCommonBlock := anObject
]

{ #category : 'navigation' }
FamixF77Variable >> parentCommonBlockGroup [
	<generated>
	<navigation: 'ParentCommonBlock'>
	^ MooseSpecializedGroup with: self parentCommonBlock
]
