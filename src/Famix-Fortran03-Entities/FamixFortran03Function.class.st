"
Im a function. You can use me in a expression and I have a declaredType: r = fct(p1,...,pN)
"
Class {
	#name : #FamixFortran03Function,
	#superclass : #FamixFortran03Procedure,
	#traits : 'FamixTFunction',
	#classTraits : 'FamixTFunction classTrait',
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03Function class >> annotation [

	<FMClass: #Function super: #FamixFortran03Procedure>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]
