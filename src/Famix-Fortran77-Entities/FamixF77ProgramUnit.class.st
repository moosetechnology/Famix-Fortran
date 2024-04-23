"
a program unit

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `programFile` | `FamixF77ProgramUnit` | `programUnits` | `FamixF77ProgramFile` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
| `externalDeclarations` | `FamixF77ProgramUnit` | `programUnit` | `FamixF77ExternalDeclaration` | |

### Outgoing dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `includes` | `FamixF77ProgramUnit` | `includedBy` | `FamixF77Include` | All inclusions made by this programUnits|

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
	#name : #FamixF77ProgramUnit,
	#superclass : #FamixF77NamedEntity,
	#traits : 'FamixTSourceEntity + FamixTWithComments + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceEntity classTrait + FamixTWithComments classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#programFile => FMOne type: #FamixF77ProgramFile opposite: #programUnits',
		'#externalDeclarations => FMMany type: #FamixF77ExternalDeclaration opposite: #programUnit',
		'#includes => FMMany type: #FamixF77Include opposite: #includedBy'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77ProgramUnit class >> annotation [

	<FMClass: #ProgramUnit super: #FamixF77NamedEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixF77ProgramUnit class >> isAbstract [

	<generated>
	^ self == FamixF77ProgramUnit
]

{ #category : #adding }
FamixF77ProgramUnit >> addExternalDeclaration: anObject [
	<generated>
	^ self externalDeclarations add: anObject
]

{ #category : #adding }
FamixF77ProgramUnit >> addInclude: anObject [
	<generated>
	^ self includes add: anObject
]

{ #category : #accessing }
FamixF77ProgramUnit >> externalDeclarations [
	"Relation named: #externalDeclarations type: #FamixF77ExternalDeclaration opposite: #programUnit"

	<generated>
	<derived>
	^ externalDeclarations
]

{ #category : #accessing }
FamixF77ProgramUnit >> externalDeclarations: anObject [

	<generated>
	externalDeclarations value: anObject
]

{ #category : #navigation }
FamixF77ProgramUnit >> externalDeclarationsGroup [
	<generated>
	<navigation: 'ExternalDeclarations'>
	^ MooseSpecializedGroup withAll: self externalDeclarations asSet
]

{ #category : #accessing }
FamixF77ProgramUnit >> includes [
	"Relation named: #includes type: #FamixF77Include opposite: #includedBy"

	<generated>
	<FMComment: 'All inclusions made by this programUnits'>
	<derived>
	^ includes
]

{ #category : #accessing }
FamixF77ProgramUnit >> includes: anObject [

	<generated>
	includes value: anObject
]

{ #category : #accessing }
FamixF77ProgramUnit >> programFile [
	"Relation named: #programFile type: #FamixF77ProgramFile opposite: #programUnits"

	<generated>
	<container>
	^ programFile
]

{ #category : #accessing }
FamixF77ProgramUnit >> programFile: anObject [

	<generated>
	programFile := anObject
]

{ #category : #navigation }
FamixF77ProgramUnit >> programFileGroup [
	<generated>
	<navigation: 'ProgramFile'>
	^ MooseSpecializedGroup with: self programFile
]
