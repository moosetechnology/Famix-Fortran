Class {
	#name : #FamixF77Model,
	#superclass : #MooseModel,
	#traits : 'FamixF77TEntityCreator',
	#classTraits : 'FamixF77TEntityCreator classTrait',
	#category : #'Famix-Fortran77-Entities-Model'
}

{ #category : #accessing }
FamixF77Model class >> allSubmetamodelsPackagesNames [
	<generated>
	^ #(#'Moose-Query' #'Famix-Traits')
]

{ #category : #meta }
FamixF77Model class >> annotation [
	<FMClass: #FamixF77Model super: #MooseModel>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
]

{ #category : #testing }
FamixF77Model class >> canBeImportedFromFile [
	<generated>
	^true
]

{ #category : #accessing }
FamixF77Model class >> importingContextClass [

	<generated>
	^ FamixF77ImportingContext
]
