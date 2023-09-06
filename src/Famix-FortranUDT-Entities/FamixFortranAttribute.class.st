"
Im a attribute for user defined type:
	- Segment component
	- Derived type component
"
Class {
	#name : #FamixFortranAttribute,
	#superclass : #FamixF77Variable,
	#traits : 'FamixTAttribute',
	#classTraits : 'FamixTAttribute classTrait',
	#instVars : [
		'#userDefinedType => FMOne type: #FamixFortranUserDefinedType opposite: #attributes'
	],
	#category : #'Famix-FortranUDT-Entities-Entities'
}

{ #category : #meta }
FamixFortranAttribute class >> annotation [

	<FMClass: #Attribute super: #FamixF77Variable>
	<package: #'Famix-FortranUDT-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixFortranAttribute >> userDefinedType [
	"Relation named: #userDefinedType type: #FamixFortranUserDefinedType opposite: #attributes"

	<generated>
	<container>
	^ userDefinedType
]

{ #category : #accessing }
FamixFortranAttribute >> userDefinedType: anObject [

	<generated>
	userDefinedType := anObject
]

{ #category : #navigation }
FamixFortranAttribute >> userDefinedTypeGroup [
	<generated>
	<navigation: 'UserDefinedType'>
	^ MooseSpecializedGroup with: self userDefinedType
]
