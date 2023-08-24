"
Im a subroutine. You can use me only as a statement, e.g: `call sub(p1,...,pN)`
"
Class {
	#name : #FamixFortran03Subroutine,
	#superclass : #FamixFortran03Procedure,
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03Subroutine class >> annotation [

	<FMClass: #Subroutine super: #FamixFortran03Procedure>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]
