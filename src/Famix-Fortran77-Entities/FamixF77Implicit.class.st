"
[Implicit](https://docs.oracle.com/cd/E19957-01/805-4939/6j4m0vn9v/index.html) statement

## Properties
======================

| Name | Type | Default value | Comment |
| `letters` | `Object` | nil | |
| `type` | `FamixTType` | nil | |

"
Class {
	#name : #FamixF77Implicit,
	#superclass : #FamixF77Entity,
	#instVars : [
		'#letters => FMProperty',
		'#type => FMProperty'
	],
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77Implicit class >> annotation [

	<FMClass: #Implicit super: #FamixF77Entity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixF77Implicit >> letters [

	<FMProperty: #letters type: #Object>
	<generated>
	^ letters
]

{ #category : #accessing }
FamixF77Implicit >> letters: anObject [
	<generated>
	letters := anObject
]

{ #category : #accessing }
FamixF77Implicit >> type [

	<FMProperty: #type type: #FamixTType>
	<generated>
	^ type
]

{ #category : #accessing }
FamixF77Implicit >> type: anObject [
	<generated>
	type := anObject
]
