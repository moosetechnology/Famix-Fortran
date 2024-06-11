"
a statement function

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentEntity` | `FamixF77StatementFunction` | `statementFunctions` | `FamixF77TWithStatements` | Entity in which body I am defined|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `localVariables` | `FamixTWithLocalVariables` | `parentBehaviouralEntity` | `FamixTLocalVariable` | Variables locally defined by this behaviour.|
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
| `declaredType` | `FamixTTypedEntity` | `typedEntities` | `FamixTType` | Type of the entity, if any|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|
| `signature` | `String` | nil | Signature of the message being sent|

"
Class {
	#name : #FamixF77StatementFunction,
	#superclass : #FamixF77NamedEntity,
	#traits : 'FamixF77TWithStatements + FamixTHasSignature + FamixTInvocable + FamixTSourceEntity + FamixTTypedEntity + FamixTWithLocalVariables + FamixTWithParameters + FamixTWithTypes',
	#classTraits : 'FamixF77TWithStatements classTrait + FamixTHasSignature classTrait + FamixTInvocable classTrait + FamixTSourceEntity classTrait + FamixTTypedEntity classTrait + FamixTWithLocalVariables classTrait + FamixTWithParameters classTrait + FamixTWithTypes classTrait',
	#instVars : [
		'#parentEntity => FMOne type: #FamixF77TWithStatements opposite: #statementFunctions'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77StatementFunction class >> annotation [

	<FMClass: #StatementFunction super: #FamixF77NamedEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixF77StatementFunction >> parentEntity [
	"Relation named: #parentEntity type: #FamixF77TWithStatements opposite: #statementFunctions"

	<generated>
	<FMComment: 'Entity in which body I am defined'>
	<container>
	^ parentEntity
]

{ #category : #accessing }
FamixF77StatementFunction >> parentEntity: anObject [

	<generated>
	parentEntity := anObject
]

{ #category : #navigation }
FamixF77StatementFunction >> parentEntityGroup [
	<generated>
	<navigation: 'ParentEntity'>
	^ MooseSpecializedGroup with: self parentEntity
]
