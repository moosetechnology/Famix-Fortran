"
A COMMON group of variables

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBehaviouralEntity` | `FamixF77CommonBlock` | `commonBlocks` | `FamixF77ProgramUnit` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `variables` | `FamixF77CommonBlock` | `parentCommonBlock` | `FamixF77Variable` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `name` | `String` | nil | Basic name of the entity, not full reference.|

"
Class {
	#name : 'FamixF77CommonBlock',
	#superclass : 'FamixF77Entity',
	#traits : 'FamixTNamedEntity + FamixTSourceEntity',
	#classTraits : 'FamixTNamedEntity classTrait + FamixTSourceEntity classTrait',
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FamixF77ProgramUnit opposite: #commonBlocks',
		'#variables => FMMany type: #FamixF77Variable opposite: #parentCommonBlock'
	],
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77CommonBlock class >> annotation [

	<FMClass: #CommonBlock super: #FamixF77Entity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixF77CommonBlock >> addVariable: anObject [
	<generated>
	^ self variables add: anObject
]

{ #category : 'accessing' }
FamixF77CommonBlock >> parentBehaviouralEntity [
	"Relation named: #parentBehaviouralEntity type: #FamixF77ProgramUnit opposite: #commonBlocks"

	<generated>
	<container>
	^ parentBehaviouralEntity
]

{ #category : 'accessing' }
FamixF77CommonBlock >> parentBehaviouralEntity: anObject [

	<generated>
	parentBehaviouralEntity := anObject
]

{ #category : 'navigation' }
FamixF77CommonBlock >> parentBehaviouralEntityGroup [
	<generated>
	<navigation: 'ParentBehaviouralEntity'>
	^ MooseSpecializedGroup with: self parentBehaviouralEntity
]

{ #category : 'accessing' }
FamixF77CommonBlock >> variables [
	"Relation named: #variables type: #FamixF77Variable opposite: #parentCommonBlock"

	<generated>
	<derived>
	^ variables
]

{ #category : 'accessing' }
FamixF77CommonBlock >> variables: anObject [

	<generated>
	variables value: anObject
]

{ #category : 'navigation' }
FamixF77CommonBlock >> variablesGroup [
	<generated>
	<navigation: 'Variables'>
	^ MooseSpecializedGroup withAll: self variables asSet
]
