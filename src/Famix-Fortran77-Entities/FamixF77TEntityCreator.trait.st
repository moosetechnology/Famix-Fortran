"
This trait is used by Famix models.
It provides an API for creating entities and adding them to the model.


"
Trait {
	#name : #FamixF77TEntityCreator,
	#category : #'Famix-Fortran77-Entities-Model'
}

{ #category : #meta }
FamixF77TEntityCreator classSide >> annotation [

	<FMClass: #TEntityCreator super: #Object>
	<package: #'Famix-Fortran77-Entities'>
	<generated>
	^ self
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newAccess [

	<generated>
	^ self add: FamixF77Access new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newComment [

	<generated>
	^ self add: FamixF77Comment new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newExternalDeclaration [

	<generated>
	^ self add: FamixF77ExternalDeclaration new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newImplicit [

	<generated>
	^ self add: FamixF77Implicit new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newInclude [

	<generated>
	^ self add: FamixF77Include new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newIncludedFile [

	<generated>
	^ self add: FamixF77IncludedFile new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newIndexedFileAnchor [

	<generated>
	^ self add: FamixF77IndexedFileAnchor new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newIntrinsicRoutine [

	<generated>
	^ self add: FamixF77IntrinsicRoutine new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newInvocation [

	<generated>
	^ self add: FamixF77Invocation new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newPUBlockdata [

	<generated>
	^ self add: FamixF77PUBlockdata new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newPUFunction [

	<generated>
	^ self add: FamixF77PUFunction new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newPUMain [

	<generated>
	^ self add: FamixF77PUMain new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newPUProcedure [

	<generated>
	^ self add: FamixF77PUProcedure new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newPUSubroutine [

	<generated>
	^ self add: FamixF77PUSubroutine new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newParameter [

	<generated>
	^ self add: FamixF77Parameter new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newParameterNamed: aName [

	<generated>
	^ self add: (FamixF77Parameter named: aName)
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newProgramFile [

	<generated>
	^ self add: FamixF77ProgramFile new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newSourceLanguage [

	<generated>
	^ self add: FamixF77SourceLanguage new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newSourceTextAnchor [

	<generated>
	^ self add: FamixF77SourceTextAnchor new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newStatementFunction [

	<generated>
	^ self add: FamixF77StatementFunction new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newType [

	<generated>
	^ self add: FamixF77Type new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newTypeIntrinsic [

	<generated>
	^ self add: FamixF77TypeIntrinsic new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newTypeNamed: aName [

	<generated>
	^ self add: (FamixF77Type named: aName)
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newTypeUnknown [

	<generated>
	^ self add: FamixF77TypeUnknown new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newUnknownVariable [

	<generated>
	^ self add: FamixF77UnknownVariable new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newUnknownVariableNamed: aName [

	<generated>
	^ self add: (FamixF77UnknownVariable named: aName)
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newVariable [

	<generated>
	^ self add: FamixF77Variable new
]

{ #category : #'entity creation' }
FamixF77TEntityCreator >> newVariableNamed: aName [

	<generated>
	^ self add: (FamixF77Variable named: aName)
]
