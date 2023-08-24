"
Thanks to me, you can import a procedures, variables, constants,... defined in a module. Im an association between a program unit and a module
"
Class {
	#name : #FamixFortran03Use,
	#superclass : #FamixFortran03Entity,
	#traits : 'FamixTAssociation',
	#classTraits : 'FamixTAssociation classTrait',
	#instVars : [
		'#used => FMOne type: #FamixFortran03Module opposite: #users',
		'#usedBy => FMOne type: #FamixFortran03ProgramUnit opposite: #uses'
	],
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03Use class >> annotation [

	<FMClass: #Use super: #FamixFortran03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixFortran03Use >> used [
	"Relation named: #used type: #FamixFortran03Module opposite: #users"

	<generated>
	<FMComment: 'Module used'>
	<target>
	^ used
]

{ #category : #accessing }
FamixFortran03Use >> used: anObject [

	<generated>
	used := anObject
]

{ #category : #accessing }
FamixFortran03Use >> usedBy [
	"Relation named: #usedBy type: #FamixFortran03ProgramUnit opposite: #uses"

	<generated>
	<FMComment: 'used by this program unit'>
	<source>
	^ usedBy
]

{ #category : #accessing }
FamixFortran03Use >> usedBy: anObject [

	<generated>
	usedBy := anObject
]
