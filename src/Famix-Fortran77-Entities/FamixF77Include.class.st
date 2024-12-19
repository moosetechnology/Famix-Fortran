"
Entity to hold `#include ""file.inc""` directive
	we need to have a path pointed by the file and the relation with all the subroutine including this file
	

## Relations
======================

### Association source
| Relation | Origin | Opposite | Type | Comment |
|---|
| `includedBy` | `FamixF77Include` | `includes` | `FamixF77ProgramUnit` | File including the receiver|

### Association target
| Relation | Origin | Opposite | Type | Comment |
|---|
| `included` | `FamixF77Include` | `inclusions` | `FamixF77IncludedFile` | File included|

### Other
| Relation | Origin | Opposite | Type | Comment |
|---|
| `next` | `FamixTAssociation` | `previous` | `FamixTAssociation` | Next association in an ordered collection of associations. Currently not supported by the Moose importer|
| `previous` | `FamixTAssociation` | `next` | `FamixTAssociation` | Previous association in an ordered collection of associations. Currently not supported by the Moose importer|
| `sourceAnchor` | `FamixTSourceEntity` | `element` | `FamixTSourceAnchor` | SourceAnchor entity linking to the original source code for this entity|


## Properties
======================

| Name | Type | Default value | Comment |
|---|
| `filename` | `String` | nil | Hold the name of the file included. Will be used to link this relation with the includedFile entity|
| `isLocal` | `Boolean` | nil | Whether this is a local include (with ""included.h"") or a system one (with <included.h>)|

"
Class {
	#name : 'FamixF77Include',
	#superclass : 'FamixF77Entity',
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#instVars : [
		'#isLocal => FMProperty',
		'#filename => FMProperty',
		'#included => FMOne type: #FamixF77IncludedFile opposite: #inclusions',
		'#includedBy => FMOne type: #FamixF77ProgramUnit opposite: #includes'
	],
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77Include class >> annotation [

	<FMClass: #Include super: #FamixF77Entity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : 'accessing' }
FamixF77Include >> filename [

	<FMProperty: #filename type: #String>
	<generated>
	<FMComment: 'Hold the name of the file included. Will be used to link this relation with the includedFile entity'>
	^ filename
]

{ #category : 'accessing' }
FamixF77Include >> filename: anObject [
	<generated>
	filename := anObject
]

{ #category : 'accessing' }
FamixF77Include >> included [
	"Relation named: #included type: #FamixF77IncludedFile opposite: #inclusions"

	<generated>
	<FMComment: 'File included'>
	<target>
	^ included
]

{ #category : 'accessing' }
FamixF77Include >> included: anObject [

	<generated>
	included := anObject
]

{ #category : 'accessing' }
FamixF77Include >> includedBy [
	"Relation named: #includedBy type: #FamixF77ProgramUnit opposite: #includes"

	<generated>
	<FMComment: 'File including the receiver'>
	<source>
	^ includedBy
]

{ #category : 'accessing' }
FamixF77Include >> includedBy: anObject [

	<generated>
	includedBy := anObject
]

{ #category : 'accessing' }
FamixF77Include >> isLocal [

	<FMProperty: #isLocal type: #Boolean>
	<generated>
	<FMComment: 'Whether this is a local include (with "included.h") or a system one (with <included.h>)'>
	^ isLocal
]

{ #category : 'accessing' }
FamixF77Include >> isLocal: anObject [
	<generated>
	isLocal := anObject
]
