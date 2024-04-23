Class {
	#name : #FamixF03Entity,
	#superclass : #MooseEntity,
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixF03Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : #testing }
FamixF03Entity class >> isAbstract [

	<generated>
	^ self == FamixF03Entity
]

{ #category : #meta }
FamixF03Entity class >> metamodel [

	<generated>
	^ FamixF03Model metamodel
]

{ #category : #testing }
FamixF03Entity >> isAssociation [

	<generated>
	^ false
]

{ #category : #testing }
FamixF03Entity >> isBehavioural [

	<generated>
	^ false
]

{ #category : #testing }
FamixF03Entity >> isInheritance [

	<generated>
	^ false
]

{ #category : #testing }
FamixF03Entity >> isMethod [

	<generated>
	^ false
]

{ #category : #testing }
FamixF03Entity >> isQueryable [

	<generated>
	^ false
]
