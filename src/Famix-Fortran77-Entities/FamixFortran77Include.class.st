"
Entity to hold `#include ""file.inc""` directive
	we need to have a path pointed by the file and the relation with all the subroutine including this file
	
"
Class {
	#name : #FamixFortran77Include,
	#superclass : #FamixFortran77Entity,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#instVars : [
		'#filename => FMProperty',
		'#included => FMOne type: #FamixFortran77IncludedFile opposite: #inclusions',
		'#includedBy => FMOne type: #FamixFortran77ProgramUnit opposite: #includes',
		'#isLocal => FMProperty'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixFortran77Include class >> annotation [

	<FMClass: #Include super: #FamixFortran77Entity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixFortran77Include >> filename [

	<FMProperty: #filename type: #String>
	<generated>
	<FMComment: 'Hold the name of the file included. Will be used to link this relation with the includedFile entity'>
	^ filename
]

{ #category : #accessing }
FamixFortran77Include >> filename: anObject [
	<generated>
	filename := anObject
]

{ #category : #accessing }
FamixFortran77Include >> included [
	"Relation named: #included type: #FamixFortran77IncludedFile opposite: #inclusions"

	<generated>
	<FMComment: 'File included'>
	<target>
	^ included
]

{ #category : #accessing }
FamixFortran77Include >> included: anObject [

	<generated>
	included := anObject
]

{ #category : #accessing }
FamixFortran77Include >> includedBy [
	"Relation named: #includedBy type: #FamixFortran77ProgramUnit opposite: #includes"

	<generated>
	<FMComment: 'File including the receiver'>
	<source>
	^ includedBy
]

{ #category : #accessing }
FamixFortran77Include >> includedBy: anObject [

	<generated>
	includedBy := anObject
]

{ #category : #accessing }
FamixFortran77Include >> isLocal [

	<FMProperty: #isLocal type: #Boolean>
	<generated>
	<FMComment: 'Whether this is a local include (with "included.h") or a system one (with <included.h>)'>
	^ isLocal
]

{ #category : #accessing }
FamixFortran77Include >> isLocal: anObject [
	<generated>
	isLocal := anObject
]
