"
Im a local variable defined inside a program unit. I have a declared type. My type can be explicit or implicit (in this case, my first letter is used to infere my type)
"
Class {
	#name : #FamixFortran03Variable,
	#superclass : #FamixFortran03Entity,
	#traits : 'FamixTLocalVariable',
	#classTraits : 'FamixTLocalVariable classTrait',
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03Variable class >> annotation [

	<FMClass: #Variable super: #FamixFortran03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]
