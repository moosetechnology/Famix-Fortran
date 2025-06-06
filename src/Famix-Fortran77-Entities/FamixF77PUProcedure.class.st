"
a procedure

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parameters` | `FamixTWithParameters` | `parentBehaviouralEntity` | `FamixTParameter` | List of formal parameters declared by this behaviour.|
| `statementFunctions` | `FamixF77TWithStatements` | `parentEntity` | `FamixF77StatementFunction` | Statement functions defined in the body|
| `types` | `FamixTWithTypes` | `typeContainer` | `FamixTType` | Types contained (declared) in this entity, if any. #types is declared in ContainerEntity because different kinds of container can embed types. Types are usually contained in a Famix.Namespace. But types can also be contained in a Famix.Class or Famix.Method (in Java with inner classes for example). Famix.Function can also contain some types such as structs.|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `accesses` | `FamixTWithAccesses` | `accessor` | `FamixTAccess` | Accesses to variables made by this behaviour.|
| `outgoingInvocations` | `FamixTWithInvocations` | `sender` | `FamixTInvocation` | Outgoing invocations sent by this behaviour.|
| `outgoingReferences` | `FamixTWithReferences` | `referencer` | `FamixTReference` | References from this entity to other entities.|

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingInvocations` | `FamixTInvocable` | `candidates` | `FamixTInvocation` | Incoming invocations from other behaviours computed by the candidate operator.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `externalUses` | `FamixF77PUProcedure` | `externalProcedure` | `FamixF77ExternalDeclaration` | |
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `signature` | `String` | nil | Signature of the message being sent|

"
Class {
	#name : 'FamixF77PUProcedure',
	#superclass : 'FamixF77ProgramUnit',
	#traits : 'FamixF77TWithStatements + FamixTHasSignature + FamixTInvocable + FamixTWithParameters + FamixTWithTypes',
	#classTraits : 'FamixF77TWithStatements classTrait + FamixTHasSignature classTrait + FamixTInvocable classTrait + FamixTWithParameters classTrait + FamixTWithTypes classTrait',
	#instVars : [
		'#externalUses => FMMany type: #FamixF77ExternalDeclaration opposite: #externalProcedure'
	],
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77PUProcedure class >> annotation [

	<FMClass: #PUProcedure super: #FamixF77ProgramUnit>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixF77PUProcedure >> addExternalUse: anObject [
	<generated>
	^ self externalUses add: anObject
]

{ #category : 'accessing' }
FamixF77PUProcedure >> externalUses [
	"Relation named: #externalUses type: #FamixF77ExternalDeclaration opposite: #externalProcedure"

	<generated>
	<derived>
	^ externalUses
]

{ #category : 'accessing' }
FamixF77PUProcedure >> externalUses: anObject [

	<generated>
	externalUses value: anObject
]
