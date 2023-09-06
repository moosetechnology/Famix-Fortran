"
a fortran file
"
Class {
	#name : #FamixF77ProgramFile,
	#superclass : #FamixF77NamedEntity,
	#traits : 'FamixTCompilationUnit + FamixTSourceEntity + TEntityMetaLevelDependency',
	#classTraits : 'FamixTCompilationUnit classTrait + FamixTSourceEntity classTrait + TEntityMetaLevelDependency classTrait',
	#instVars : [
		'#filename => FMProperty',
		'#programUnits => FMMany type: #FamixF77ProgramUnit opposite: #programFile',
		'#version => FMProperty'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77ProgramFile class >> annotation [

	<FMClass: #ProgramFile super: #FamixF77NamedEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixF77ProgramFile >> addProgramUnit: anObject [
	<generated>
	^ self programUnits add: anObject
]

{ #category : #accessing }
FamixF77ProgramFile >> filename [

	<FMProperty: #filename type: #String>
	<generated>
	<FMComment: 'Fortran name of the file'>
	^ filename
]

{ #category : #accessing }
FamixF77ProgramFile >> filename: anObject [
	<generated>
	filename := anObject
]

{ #category : #accessing }
FamixF77ProgramFile >> programUnits [
	"Relation named: #programUnits type: #FamixF77ProgramUnit opposite: #programFile"

	<generated>
	<derived>
	^ programUnits
]

{ #category : #accessing }
FamixF77ProgramFile >> programUnits: anObject [

	<generated>
	programUnits value: anObject
]

{ #category : #navigation }
FamixF77ProgramFile >> programUnitsGroup [
	<generated>
	<navigation: 'ProgramUnits'>
	^ MooseSpecializedGroup withAll: self programUnits asSet
]

{ #category : #accessing }
FamixF77ProgramFile >> symbolTable [

	^ self attributeAt: #symbolTable ifAbsentPut: [ Dictionary new ]
]

{ #category : #accessing }
FamixF77ProgramFile >> version [

	<FMProperty: #version type: #String>
	<generated>
	<FMComment: 'Fortran version of the file'>
	^ version
]

{ #category : #accessing }
FamixF77ProgramFile >> version: anObject [
	<generated>
	version := anObject
]
