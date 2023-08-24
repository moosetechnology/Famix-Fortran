"
Im a module. Use me if you want to organize your projet and avoid some legacy constructs like common, equivalence and so on...
"
Class {
	#name : #FamixFortran03Module,
	#superclass : #FamixFortran03ProgramUnit,
	#instVars : [
		'#users => FMMany type: #FamixFortran03Use opposite: #used'
	],
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03Module class >> annotation [

	<FMClass: #Module super: #FamixFortran03ProgramUnit>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]

{ #category : #adding }
FamixFortran03Module >> addUser: anObject [
	<generated>
	^ self users add: anObject
]

{ #category : #accessing }
FamixFortran03Module >> users [
	"Relation named: #users type: #FamixFortran03Use opposite: #used"

	<generated>
	<FMComment: 'All users of this module'>
	<derived>
	^ users
]

{ #category : #accessing }
FamixFortran03Module >> users: anObject [

	<generated>
	users value: anObject
]
