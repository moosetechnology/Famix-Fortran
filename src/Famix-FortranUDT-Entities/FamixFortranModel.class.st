Class {
	#name : 'FamixFortranModel',
	#superclass : 'MooseModel',
	#traits : 'FamixF77TEntityCreator + FamixFortranTEntityCreator',
	#classTraits : 'FamixF77TEntityCreator classTrait + FamixFortranTEntityCreator classTrait',
	#category : 'Famix-FortranUDT-Entities-Model',
	#package : 'Famix-FortranUDT-Entities',
	#tag : 'Model'
}

{ #category : 'accessing' }
FamixFortranModel class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits' #'Famix-Fortran77-Entities')
]

{ #category : 'meta' }
FamixFortranModel class >> annotation [
	<FMClass: #FamixFortranModel super: #MooseModel>
	<package: #'Famix-FortranUDT-Entities'>
	<generated>
]
