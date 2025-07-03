"
Im a external declaration. 
	[See more](https://docs.oracle.com/cd/E19957-01/805-4939/6j4m0vn9d/index.html)

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `programUnit` | `FamixF77ExternalDeclaration` | `externalDeclarations` | `FamixF77ProgramUnit` | |

### Incoming dependencies
| Relation | Origin | Opposite | Type | Comment |
|---|
| `incomingInvocations` | `FamixTInvocable` | `candidates` | `FamixTInvocation` | Incoming invocations from other behaviours computed by the candidate operator.|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `externalProcedure` | `FamixF77ExternalDeclaration` | `externalUses` | `FamixF77PUProcedure` | |
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|



"
Class {
	#name : 'FamixF77ExternalDeclaration',
	#superclass : 'FamixF77NamedEntity',
	#traits : 'FamixTInvocable + FamixTSourceEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTInvocable classTrait + FamixTSourceEntity classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#programUnit => FMOne type: #FamixF77ProgramUnit opposite: #externalDeclarations',
		'#externalProcedure => FMOne type: #FamixF77PUProcedure opposite: #externalUses'
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
FamixF77ExternalDeclaration >> externalProcedure [
	"Relation named: #externalProcedure type: #FamixF77PUProcedure opposite: #externalUses"

	<generated>
	^ externalProcedure
]

{ #category : 'accessing' }
FamixF77ExternalDeclaration >> externalProcedure: anObject [

	<generated>
	externalProcedure := anObject
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
