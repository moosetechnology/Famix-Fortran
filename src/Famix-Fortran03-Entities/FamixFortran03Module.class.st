"
Im a module. Use me if you want to organize your projet and avoid some legacy constructs like common, equivalence and so on...
"
Class {
	#name : #FamixFortran03Module,
	#superclass : #FamixFortran03ProgramUnit,
	#instVars : [
		'#usages => FMMany type: #FamixFortran03Use opposite: #used'
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
FamixFortran03Module >> addUsage: anObject [
	<generated>
	^ self usages add: anObject
]

{ #category : #accessing }
FamixFortran03Module >> usages [
	"Relation named: #usages type: #FamixFortran03Use opposite: #used"

	<generated>
	<FMComment: 'All usages of this module'>
	<derived>
	^ usages
]

{ #category : #accessing }
FamixFortran03Module >> usages: anObject [

	<generated>
	usages value: anObject
]
