"
a fortran comment
"
Class {
	#name : #FamixF77Comment,
	#superclass : #FamixF77SourcedEntity,
	#traits : 'FamixTComment',
	#classTraits : 'FamixTComment classTrait',
	#instVars : [
		'#isEsope => FMProperty defaultValue: false'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77Comment class >> annotation [

	<FMClass: #Comment super: #FamixF77SourcedEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixF77Comment >> isEsope [

	<FMProperty: #isEsope type: #Boolean defaultValue: false>
	<generated>
	<FMComment: 'It is esope comment ?'>
	^ isEsope ifNil: [ isEsope := false ]
]

{ #category : #accessing }
FamixF77Comment >> isEsope: anObject [
	<generated>
	isEsope := anObject
]
