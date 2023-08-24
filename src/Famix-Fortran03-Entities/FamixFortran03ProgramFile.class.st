"
Im a file containing a ProgUnit
"
Class {
	#name : #FamixFortran03ProgramFile,
	#superclass : #FamixFortran03Entity,
	#traits : 'FamixTCompilationUnit',
	#classTraits : 'FamixTCompilationUnit classTrait',
	#instVars : [
		'#abstractProgramUnits => FMMany type: #FamixFortran03AbstractProgramUnit opposite: #programFile'
	],
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03ProgramFile class >> annotation [

	<FMClass: #ProgramFile super: #FamixFortran03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixFortran03ProgramFile >> abstractProgramUnits [
	"Relation named: #abstractProgramUnits type: #FamixFortran03AbstractProgramUnit opposite: #programFile"

	<generated>
	<derived>
	^ abstractProgramUnits
]

{ #category : #accessing }
FamixFortran03ProgramFile >> abstractProgramUnits: anObject [

	<generated>
	abstractProgramUnits value: anObject
]

{ #category : #navigation }
FamixFortran03ProgramFile >> abstractProgramUnitsGroup [
	<generated>
	<navigation: 'AbstractProgramUnits'>
	^ MooseSpecializedGroup withAll: self abstractProgramUnits asSet
]

{ #category : #adding }
FamixFortran03ProgramFile >> addAbstractProgramUnit: anObject [
	<generated>
	^ self abstractProgramUnits add: anObject
]
