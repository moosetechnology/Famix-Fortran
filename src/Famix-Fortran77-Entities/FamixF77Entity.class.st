Class {
	#name : 'FamixF77Entity',
	#superclass : 'MooseEntity',
	#category : 'Famix-Fortran77-Entities-Entities',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixF77Entity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixF77Entity class >> isAbstract [

	<generated>
	^ self == FamixF77Entity
]

{ #category : 'meta' }
FamixF77Entity class >> metamodel [

	<generated>
	^ FamixF77Model metamodel
]

{ #category : 'testing' }
FamixF77Entity >> isAccess [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixF77Entity >> isAssociation [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixF77Entity >> isBehavioural [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixF77Entity >> isComment [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixF77Entity >> isFileAnchor [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixF77Entity >> isInvocation [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixF77Entity >> isLocalVariable [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixF77Entity >> isNamedEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixF77Entity >> isQueryable [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixF77Entity >> isStructuralEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixF77Entity >> isType [

	<generated>
	^ false
]
