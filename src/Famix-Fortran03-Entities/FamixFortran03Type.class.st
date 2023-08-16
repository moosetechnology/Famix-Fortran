"
Im a type. I can be either a Instrinsic or User-defined-type
"
Class {
	#name : #FamixFortran03Type,
	#superclass : #FamixFortran03Entity,
	#traits : 'FamixTType',
	#classTraits : 'FamixTType classTrait',
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03Type class >> annotation [

	<FMClass: #Type super: #FamixFortran03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]
