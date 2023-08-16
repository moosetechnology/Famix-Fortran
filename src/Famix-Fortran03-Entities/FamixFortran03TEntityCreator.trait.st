"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.
"
Trait {
	#name : #FamixFortran03TEntityCreator,
	#category : #'Famix-Fortran03-Entities-Model'
}

{ #category : #meta }
FamixFortran03TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Fortran03-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newAbstractProgramUnit [

	<generated>
	^ self add: FamixFortran03AbstractProgramUnit new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newComment [

	<generated>
	^ self add: FamixFortran03Comment new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newFunction [

	<generated>
	^ self add: FamixFortran03Function new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newFunctionNamed: aName [

	<generated>
	^ self add: (FamixFortran03Function named: aName)
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newModule [

	<generated>
	^ self add: FamixFortran03Module new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newPUComment [

	<generated>
	^ self add: FamixFortran03PUComment new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newProcedure [

	<generated>
	^ self add: FamixFortran03Procedure new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newProgram [

	<generated>
	^ self add: FamixFortran03Program new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newProgramFile [

	<generated>
	^ self add: FamixFortran03ProgramFile new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newProgramUnit [

	<generated>
	^ self add: FamixFortran03ProgramUnit new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newProgramUnitNamed: aName [

	<generated>
	^ self add: (FamixFortran03ProgramUnit named: aName)
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixFortran03SourceLanguage new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixFortran03SourceTextAnchor new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newSubroutine [

	<generated>
	^ self add: FamixFortran03Subroutine new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newType [

	<generated>
	^ self add: FamixFortran03Type new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newTypeNamed: aName [

	<generated>
	^ self add: (FamixFortran03Type named: aName)
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newUnknownSourceLanguage [

	<generated>
	^ self add: FamixFortran03UnknownSourceLanguage new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newUse [

	<generated>
	^ self add: FamixFortran03Use new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newVariable [

	<generated>
	^ self add: FamixFortran03Variable new
]

{ #category : #'entity creation' }
FamixFortran03TEntityCreator >> newVariableNamed: aName [

	<generated>
	^ self add: (FamixFortran03Variable named: aName)
]
