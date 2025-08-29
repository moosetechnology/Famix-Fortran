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
| `localVariables` | `FamixTWithLocalVariables` | `parentBehaviouralEntity` | `FamixTLocalVariable` | Variables locally defined by this behaviour.|

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
	#traits : 'FamixTNamedEntity + FamixTSourceEntity + FamixTWithLocalVariables + TEntityMetaLevelDependency',
	#classTraits : 'FamixTNamedEntity classTrait + FamixTSourceEntity classTrait + FamixTWithLocalVariables classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FamixF77ProgramUnit opposite: #commonBlocks'
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
