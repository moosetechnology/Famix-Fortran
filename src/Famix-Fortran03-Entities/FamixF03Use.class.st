"
Thanks to me, you can import a procedures, variables, constants,... defined in a module. Im an association between a program unit and a module
"
Class {
	#name : #FamixF03Use,
	#superclass : #FamixF03Entity,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#instVars : [
		'#used => FMOne type: #FamixF03Module opposite: #users'
	],
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixF03Use class >> annotation [

	<FMClass: #Use super: #FamixF03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixF03Use >> used [
	"Relation named: #used type: #FamixF03Module opposite: #users"

	<generated>
	<FMComment: 'Module used'>
	<target>
	^ used
]

{ #category : #accessing }
FamixF03Use >> used: anObject [

	<generated>
	used := anObject
]

{ #category : #accessing }
FamixF03Use >> usedBy [
	"Relation named: #usedBy type: #FamixF77ProgramUnit opposite: #uses"

	<generated>
	<FMComment: 'used by this program unit'>
	<source>
	<FMProperty: #usedBy type: #FamixF77ProgramUnit opposite: #uses>
	^ self attributeAt: #usedBy ifAbsent: [ nil ]
]

{ #category : #accessing }
FamixF03Use >> usedBy: anObject [

	<generated>
	self attributeAt: #usedBy put: (FMMultivalueLink on: self update: #uses from: self usedBy to: anObject).
]
