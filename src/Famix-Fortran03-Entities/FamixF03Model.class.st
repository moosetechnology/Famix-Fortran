Class {
	#name : #FamixF03Model,
	#superclass : #MooseModel,
	#traits : 'FamixF03TEntityCreator + FamixF77TEntityCreator + FamixFortranTEntityCreator',
	#classTraits : 'FamixF03TEntityCreator classTrait + FamixF77TEntityCreator classTrait + FamixFortranTEntityCreator classTrait',
	#category : #'Famix-Fortran03-Entities-Model'
}

{ #category : #accessing }
FamixF03Model class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' #'Famix-FortranUDT-Entities' #'Famix-Fortran77-Entities')
]

{ #category : #meta }
FamixF03Model class >> annotation [
	<FMClass: #FamixF03Model super: #MooseModel>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
]
