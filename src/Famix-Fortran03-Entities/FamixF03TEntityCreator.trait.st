"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.
"
Trait {
	#name : #FamixF03TEntityCreator,
	#category : #'Famix-Fortran03-Entities-Model'
}

{ #category : #meta }
FamixF03TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixF03TEntityCreator >> newComment [

	<generated>
	^ self add: FamixF03Comment new
]

{ #category : #'entity creation' }
FamixF03TEntityCreator >> newDerivedType [

	<generated>
	^ self add: FamixF03DerivedType new
]

{ #category : #'entity creation' }
FamixF03TEntityCreator >> newInheritance [

	<generated>
	^ self add: FamixF03Inheritance new
]

{ #category : #'entity creation' }
FamixF03TEntityCreator >> newMethod [

	<generated>
	^ self add: FamixF03Method new
]

{ #category : #'entity creation' }
FamixF03TEntityCreator >> newMethodNamed: aName [

	<generated>
	^ self add: (FamixF03Method named: aName)
]

{ #category : #'entity creation' }
FamixF03TEntityCreator >> newModule [

	<generated>
	^ self add: FamixF03Module new
]

{ #category : #'entity creation' }
FamixF03TEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixF03SourceLanguage new
]

{ #category : #'entity creation' }
FamixF03TEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixF03SourceTextAnchor new
]

{ #category : #'entity creation' }
FamixF03TEntityCreator >> newUnknownSourceLanguage [

	<generated>
	^ self add: FamixF03UnknownSourceLanguage new
]

{ #category : #'entity creation' }
FamixF03TEntityCreator >> newUse [

	<generated>
	^ self add: FamixF03Use new
]
