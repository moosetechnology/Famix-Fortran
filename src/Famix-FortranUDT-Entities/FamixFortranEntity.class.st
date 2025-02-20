Class {
	#name : 'FamixFortranEntity',
	#superclass : 'MooseEntity',
	#category : 'Famix-FortranUDT-Entities-Entities',
	#package : 'Famix-FortranUDT-Entities',
	#tag : 'Entities'
}

{ #category : 'meta' }
FamixFortranEntity class >> annotation [

	<FMClass: #Entity super: #MooseEntity>
	<package: #'Famix-FortranUDT-Entities'>
	<generated>
	<abstract>
	^ self
]

{ #category : 'testing' }
FamixFortranEntity class >> isAbstract [

	<generated>
	^ self == FamixFortranEntity
]

{ #category : 'meta' }
FamixFortranEntity class >> metamodel [

	<generated>
	^ FamixFortranModel metamodel
]

{ #category : 'testing' }
FamixFortranEntity >> isAttribute [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixFortranEntity >> isNamedEntity [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixFortranEntity >> isQueryable [

	<generated>
	^ false
]

{ #category : 'testing' }
FamixFortranEntity >> isStructuralEntity [

	<generated>
	^ false
]
