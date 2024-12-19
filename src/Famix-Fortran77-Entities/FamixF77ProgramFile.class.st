"
a fortran file

## Relations
======================

### Parents
| Relation | Origin | Opposite | Type | Comment |
|---|
| `compilationUnitOwner` | `FamixTCompilationUnit` | `compilationUnit` | `FamixTWithCompilationUnits` | The compilation unit that defines this module|
| `parentFolder` | `FamixTFileSystemEntity` | `childrenFileSystemEntities` | `FamixTFolder` | Folder entity containing this file.|

### Children
| Relation | Origin | Opposite | Type | Comment |
|---|
| `comments` | `FamixTWithComments` | `commentedEntity` | `FamixTComment` | List of comments for the entity|
| `programUnits` | `FamixF77ProgramFile` | `programFile` | `FamixF77ProgramUnit` | |

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `entities` | `FamixTFile` | `containerFiles` | `FamixTWithFiles` | List of entities defined in the file|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `filename` | `String` | nil | Fortran name of the file|
| `version` | `String` | nil | Fortran version of the file|

"
Class {
	#name : 'FamixF77ProgramFile',
	#superclass : 'FamixF77NamedEntity',
	#traits : 'FamixTCompilationUnit + (FamixTSourceEntity - {#sourceText}) + FamixTWithComments + TEntityMetaLevelDependency',
	#classTraits : 'FamixTCompilationUnit classTrait + FamixTSourceEntity classTrait + FamixTWithComments classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#filename => FMProperty',
		'#programUnits => FMMany type: #FamixF77ProgramUnit opposite: #programFile',
		'#version => FMProperty'
	],
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77ProgramFile class >> annotation [

	<FMClass: #ProgramFile super: #FamixF77NamedEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : 'adding' }
FamixF77ProgramFile >> addProgramUnit: anObject [
	<generated>
	^ self programUnits add: anObject
]

{ #category : 'accessing' }
FamixF77ProgramFile >> filename [

	<FMProperty: #filename type: #String>
	<generated>
	<FMComment: 'Fortran name of the file'>
	^ filename
]

{ #category : 'accessing' }
FamixF77ProgramFile >> filename: anObject [
	<generated>
	filename := anObject
]

{ #category : 'accessing' }
FamixF77ProgramFile >> programUnits [
	"Relation named: #programUnits type: #FamixF77ProgramUnit opposite: #programFile"

	<generated>
	<derived>
	^ programUnits
]

{ #category : 'accessing' }
FamixF77ProgramFile >> programUnits: anObject [

	<generated>
	programUnits value: anObject
]

{ #category : 'navigation' }
FamixF77ProgramFile >> programUnitsGroup [
	<generated>
	<navigation: 'ProgramUnits'>
	^ MooseSpecializedGroup withAll: self programUnits asSet
]

{ #category : 'accessing' }
FamixF77ProgramFile >> version [

	<FMProperty: #version type: #String>
	<generated>
	<FMComment: 'Fortran version of the file'>
	^ version
]

{ #category : 'accessing' }
FamixF77ProgramFile >> version: anObject [
	<generated>
	version := anObject
]
