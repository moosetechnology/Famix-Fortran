"
an access of a variable
"
Class {
	#name : #FamixF77Access,
	#superclass : #FamixF77Entity,
	#traits : 'FamixTAccess + TEntityMetaLevelDependency',
	#classTraits : 'FamixTAccess classTrait + TEntityMetaLevelDependency classTrait',
	#category : #'Famix-Fortran77-Entities-Entities'
}

{ #category : #meta }
FamixF77Access class >> annotation [

	<FMClass: #Access super: #FamixF77Entity>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]
