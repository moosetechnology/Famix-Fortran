"
I'm an external declaration `EXTERNAL fct`.

The EXTERNAL statement specifies procedures or dummy procedures as external, and allows their symbolic names to be used as actual arguments.
 
	[See more](https://docs.oracle.com/cd/E19957-01/805-4939/6j4m0vn9d/index.html)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `programUnit` | `FamixF77ExternalDeclaration` | `externalDeclarations` | `FamixF77ProgramUnit` | |

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
	#name : 'FamixF77ExternalDeclaration',
	#superclass : 'FamixF77NamedEntity',
	#traits : 'FamixTSourceEntity',
	#classTraits : 'FamixTSourceEntity classTrait',
	#instVars : [
		'#programUnit => FMOne type: #FamixF77ProgramUnit opposite: #externalDeclarations'
	],
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77ExternalDeclaration class >> annotation [

	<FMClass: #ExternalDeclaration super: #FamixF77NamedEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixF77ExternalDeclaration >> programUnit [
	"Relation named: #programUnit type: #FamixF77ProgramUnit opposite: #externalDeclarations"

	<generated>
	<container>
	^ programUnit
]

{ #category : 'accessing' }
FamixF77ExternalDeclaration >> programUnit: anObject [

	<generated>
	programUnit := anObject
]

{ #category : 'navigation' }
FamixF77ExternalDeclaration >> programUnitGroup [
	<generated>
	<navigation: 'ProgramUnit'>
	^ MooseSpecializedGroup with: self programUnit
]
