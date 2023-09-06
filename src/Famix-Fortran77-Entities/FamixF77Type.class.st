"
Im a Abstract Type, can be subclassed by TypeInstrinsic and Segment
"
Class {
	#name : #FamixF77Type,
	#superclass : #FamixF77Entity,
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#instVars : [
		'#kind => FMProperty',
		'#length => FMProperty'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77Type class >> annotation [

	<FMClass: #Type super: #FamixF77Entity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixF77Type >> kind [

	<FMProperty: #kind type: #Number>
	<generated>
	<FMComment: 'kind attribute'>
	^ kind
]

{ #category : #accessing }
FamixF77Type >> kind: anObject [
	<generated>
	kind := anObject
]

{ #category : #accessing }
FamixF77Type >> length [

	<FMProperty: #length type: #Number>
	<generated>
	<FMComment: 'length attribute'>
	^ length
]

{ #category : #accessing }
FamixF77Type >> length: anObject [
	<generated>
	length := anObject
]
