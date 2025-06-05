"
Im a Abstract Type, can be subclassed by TypeInstrinsic and Segment

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `typeContainer` | `FamixTType` | `types` | `FamixTWithTypes` | Container entity to which this type belongs. Container is a namespace, not a package (Smalltalk).|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingReferences` | `FamixTReferenceable` | `referredEntity` | `FamixTReference` | References to this entity by other entities.|
| `incomingTypings` | `FamixTType` | `declaredType` | `FamixTEntityTyping` | Relations to the entities that have this as type.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `kind` | `Number` | nil | kind attribute of a type|
| `length` | `Number` | nil | length attribute of a type|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixF77Type',
	#superclass : 'FamixF77Entity',
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#instVars : [
		'#length => FMProperty',
		'#kind => FMProperty'
	],
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77Type class >> annotation [

	<FMClass: #Type super: #FamixF77Entity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixF77Type >> kind [

	<FMProperty: #kind type: #Number>
	<generated>
	<FMComment: 'kind attribute of a type'>
	^ kind
]

{ #category : 'accessing' }
FamixF77Type >> kind: anObject [
	<generated>
	kind := anObject
]

{ #category : 'accessing' }
FamixF77Type >> length [

	<FMProperty: #length type: #Number>
	<generated>
	<FMComment: 'length attribute of a type'>
	^ length
]

{ #category : 'accessing' }
FamixF77Type >> length: anObject [
	<generated>
	length := anObject
]
