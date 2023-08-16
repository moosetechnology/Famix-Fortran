Class {
	#name : #FamixFortran03Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixFortran03Entity class >> isAbstract [

	<generated>
	^ self == FamixFortran03Entity
]

{ #category : #meta }
FamixFortran03Entity class >> metamodel [

	<generated>
	^ FamixFortran03Model metamodel
]

{ #category : #testing }
FamixFortran03Entity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixFortran03Entity >> isBehavioural [

	<generated>
	^ false
]

{ #category : #testing }
FamixFortran03Entity >> isFunction [

	<generated>
	^ false
]

{ #category : #testing }
FamixFortran03Entity >> isLocalVariable [

	<generated>
	^ false
]

{ #category : #testing }
FamixFortran03Entity >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : #testing }
FamixFortran03Entity >> isType [

	<generated>
	^ false
]
