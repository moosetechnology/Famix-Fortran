Class {
	#name : #FamixFortran03SourceLanguage,
	#superclass : #FamixFortran03Entity,
	#traits : 'FamixTSourceLanguage',
	#classTraits : 'FamixTSourceLanguage classTrait',
	#category : #'Famix-Fortran03-Entities-Entities'
}

{ #category : #meta }
FamixFortran03SourceLanguage class >> annotation [

	<FMClass: #SourceLanguage super: #FamixFortran03Entity>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]

{ #category : #accessing }
FamixFortran03SourceLanguage >> isFortran [

	^ true
]

{ #category : #accessing }
FamixFortran03SourceLanguage >> name [
	
	<FMProperty: #name type: #String> 
	<derived>
	<FMComment: 'The name of the language'>
	
	^ 'Fortran'
]

{ #category : #accessing }
FamixFortran03SourceLanguage >> version [
	
	<FMProperty: #version type: #String> 
	<derived>
	<FMComment: 'The version of the language'>
	
	^ '2003'
]
