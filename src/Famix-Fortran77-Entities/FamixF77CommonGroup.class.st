"
A COMMON group of variables

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `parentBehaviouralEntity` | `FamixF77CommonGroup` | `commonGroups` | `FamixF77ProgramUnit` | |

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `localVariables` | `FamixTWithLocalVariables` | `parentBehaviouralEntity` | `FamixTLocalVariable` | Variables locally defined by this behaviour.|



"
Class {
	#name : 'FamixF77CommonGroup',
	#superclass : 'FamixF77NamedEntity',
	#traits : 'FamixTWithLocalVariables',
	#classTraits : 'FamixTWithLocalVariables classTrait',
	#instVars : [
		'#parentBehaviouralEntity => FMOne type: #FamixF77ProgramUnit opposite: #commonGroups'
	],
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77CommonGroup class >> annotation [

	<FMClass: #CommonGroup super: #FamixF77NamedEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixF77CommonGroup >> parentBehaviouralEntity [
	"Relation named: #parentBehaviouralEntity type: #FamixF77ProgramUnit opposite: #commonGroups"

	<generated>
	<container>
	^ parentBehaviouralEntity
]

{ #category : 'accessing' }
FamixF77CommonGroup >> parentBehaviouralEntity: anObject [

	<generated>
	parentBehaviouralEntity := anObject
]

{ #category : 'navigation' }
FamixF77CommonGroup >> parentBehaviouralEntityGroup [
	<generated>
	<navigation: 'ParentBehaviouralEntity'>
	^ MooseSpecializedGroup with: self parentBehaviouralEntity
]
