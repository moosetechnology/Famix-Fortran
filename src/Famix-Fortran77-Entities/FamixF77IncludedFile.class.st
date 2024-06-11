"
includedFile

## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
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
| `inclusions` | `FamixF77IncludedFile` | `included` | `FamixF77Include` | All inclusions of this file|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isStub` | `Boolean` | false | Flag true if the entity attributes are incomplete, either because the entity is missing or not imported.|

"
Class {
	#name : #FamixF77IncludedFile,
	#superclass : #FamixF77ProgramUnit,
	#traits : 'FamixF77TWithStatements + FamixTWithTypes',
	#classTraits : 'FamixF77TWithStatements classTrait + FamixTWithTypes classTrait',
	#instVars : [
		'#inclusions => FMMany type: #FamixF77Include opposite: #included'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77IncludedFile class >> annotation [

	<FMClass: #IncludedFile super: #FamixF77ProgramUnit>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixF77IncludedFile >> addInclusion: anObject [
	<generated>
	^ self inclusions add: anObject
]

{ #category : #accessing }
FamixF77IncludedFile >> inclusions [
	"Relation named: #inclusions type: #FamixF77Include opposite: #included"

	<generated>
	<FMComment: 'All inclusions of this file'>
	<derived>
	^ inclusions
]

{ #category : #accessing }
FamixF77IncludedFile >> inclusions: anObject [

	<generated>
	inclusions value: anObject
]
