"
## Relations
======================

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `statementFunctions` | `FamixF77TWithStatements` | `parentEntity` | `FamixF77StatementFunction` | Statement functions defined in the body|

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `accesses` | `FamixTWithAccesses` | `accessor` | `FamixTAccess` | Accesses to variables made by this behaviour.|
| `outgoingInvocations` | `FamixTWithInvocations` | `sender` | `FamixTInvocation` | Outgoing invocations sent by this behaviour.|
| `outgoingReferences` | `FamixTWithReferences` | `referencer` | `FamixTReference` | References from this entity to other entities.|

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
Trait {
	#name : 'FamixF77TWithStatements',
	#instVars : [
		'#statementFunctions => FMMany type: #FamixF77StatementFunction opposite: #parentEntity'
	],
	#traits : 'FamixTWithStatements',
	#classTraits : 'FamixTWithStatements classTrait',
	#category : 'Famix-Fortran77-Entities-Traits',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Traits'
}

{ #category : 'meta' }
FamixF77TWithStatements classSide >> annotation [

	<FMClass: #TWithStatements super: #Object>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixF77TWithStatements >> addStatementFunction: anObject [
	<generated>
	^ self statementFunctions add: anObject
]

{ #category : 'accessing' }
FamixF77TWithStatements >> statementFunctions [
	"Relation named: #statementFunctions type: #FamixF77StatementFunction opposite: #parentEntity"

	<generated>
	<FMComment: 'Statement functions defined in the body'>
	<derived>
	^ statementFunctions
]

{ #category : 'accessing' }
FamixF77TWithStatements >> statementFunctions: anObject [

	<generated>
	statementFunctions value: anObject
]

{ #category : 'navigation' }
FamixF77TWithStatements >> statementFunctionsGroup [
	<generated>
	<navigation: 'StatementFunctions'>
	^ MooseSpecializedGroup withAll: self statementFunctions asSet
]
