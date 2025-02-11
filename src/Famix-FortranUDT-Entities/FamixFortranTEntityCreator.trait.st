"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : 'FamixFortranTEntityCreator',
	#category : 'Famix-FortranUDT-Entities-Model',
	#package : 'Famix-FortranUDT-Entities',
	#tag : 'Model'
}

{ #category : 'meta' }
FamixFortranTEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-FortranUDT-Entities'>
	<generated>
	^ self
]

{ #category : 'entity creation' }
FamixFortranTEntityCreator >> newAttribute [

	<generated>
	^ self add: FamixFortranAttribute new
]

{ #category : 'entity creation' }
FamixFortranTEntityCreator >> newAttributeNamed: aName [

	<generated>
	^ self add: (FamixFortranAttribute named: aName)
]

{ #category : 'entity creation' }
FamixFortranTEntityCreator >> newComment [

	<generated>
	^ self add: FamixFortranComment new
]

{ #category : 'entity creation' }
FamixFortranTEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixFortranSourceLanguage new
]

{ #category : 'entity creation' }
FamixFortranTEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixFortranSourceTextAnchor new
]
