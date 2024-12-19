"
Im a external declaration. 
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



"
Class {
	#name : 'FamixF77ExternalDeclaration',
	#superclass : 'FamixF77NamedEntity',
	#traits : 'FamixTSourceEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTSourceEntity classTrait + TEntityMetaLevelDependency classTrait',
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
