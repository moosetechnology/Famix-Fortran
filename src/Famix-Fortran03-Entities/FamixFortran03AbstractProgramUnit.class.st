"
Im a program unit with a special fake program unit PUComment
"
Class {
	#name : #FamixFortran03AbstractProgramUnit,
	#superclass : #FamixFortran03Entity,
	#traits : 'FamixTWithComments',
	#classTraits : 'FamixTWithComments classTrait',
	#instVars : [
		'#programFile => FMOne type: #FamixFortran03ProgramFile opposite: #abstractProgramUnits'
	],
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03AbstractProgramUnit class >> annotation [

	<FMClass: #AbstractProgramUnit super: #FamixFortran03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixFortran03AbstractProgramUnit >> programFile [
	"Relation named: #programFile type: #FamixFortran03ProgramFile opposite: #abstractProgramUnits"

	<generated>
	<container>
	^ programFile
]

{ #category : #accessing }
FamixFortran03AbstractProgramUnit >> programFile: anObject [

	<generated>
	programFile := anObject
]

{ #category : #navigation }
FamixFortran03AbstractProgramUnit >> programFileGroup [
	<generated>
	<navigation: 'ProgramFile'>
	^ MooseSpecializedGroup with: self programFile
]
