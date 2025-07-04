"
abstract class for all kind of variable

## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `isEsope` | `Boolean` | false | Is it an Esope pointer ?|

"
Class {
	#name : 'FamixF77StructuralEntity',
	#superclass : 'FamixF77NamedEntity',
	#instVars : [
		'#isEsope => FMProperty defaultValue: false'
	],
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77StructuralEntity class >> annotation [

	<FMClass: #StructuralEntity super: #FamixF77NamedEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixF77StructuralEntity >> isEsope [

	<FMProperty: #isEsope type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'Is it an Esope pointer ?'>
	^ isEsope ifNil: [ isEsope := false ]
]

{ #category : 'accessing' }
FamixF77StructuralEntity >> isEsope: anObject [
	<generated>
	isEsope := anObject
]
