"
This class is used to choose the entities to be imported when loading a model from file.
It is used by `MiImportingContextPresenter` in a `MiImportModelFromFileDialog` to import a FamixF77Model.
"
Class {
	#name : #FamixF77ImportingContext,
	#superclass : #FamixImportingContext,
	#category : #'Famix-Fortran77-Entities-Import'
}

{ #category : #accessing }
FamixF77ImportingContext class >> importedMetamodel [

	<generated>
	^ FamixF77Model metamodel
]

{ #category : #importing }
FamixF77ImportingContext >> importAccess [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Access)
]

{ #category : #importing }
FamixF77ImportingContext >> importComment [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Comment)
]

{ #category : #importing }
FamixF77ImportingContext >> importExternalDeclaration [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ExternalDeclaration)
]

{ #category : #importing }
FamixF77ImportingContext >> importInclude [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Include)
]

{ #category : #importing }
FamixF77ImportingContext >> importIncludedFile [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #IncludedFile)
]

{ #category : #importing }
FamixF77ImportingContext >> importIndexedFileAnchor [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #IndexedFileAnchor)
]

{ #category : #importing }
FamixF77ImportingContext >> importInvocation [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Invocation)
]

{ #category : #importing }
FamixF77ImportingContext >> importPUBlockdata [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PUBlockdata)
]

{ #category : #importing }
FamixF77ImportingContext >> importPUComment [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PUComment)
]

{ #category : #importing }
FamixF77ImportingContext >> importPUFunction [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PUFunction)
]

{ #category : #importing }
FamixF77ImportingContext >> importPUMain [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PUMain)
]

{ #category : #importing }
FamixF77ImportingContext >> importPUProcedure [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PUProcedure)
]

{ #category : #importing }
FamixF77ImportingContext >> importPUSubroutine [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PUSubroutine)
]

{ #category : #importing }
FamixF77ImportingContext >> importParameter [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Parameter)
]

{ #category : #importing }
FamixF77ImportingContext >> importProgramFile [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ProgramFile)
]

{ #category : #importing }
FamixF77ImportingContext >> importSourceLanguage [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceLanguage)
]

{ #category : #importing }
FamixF77ImportingContext >> importSourceTextAnchor [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceTextAnchor)
]

{ #category : #importing }
FamixF77ImportingContext >> importType [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Type)
]

{ #category : #importing }
FamixF77ImportingContext >> importTypeIntrinsic [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #TypeIntrinsic)
]

{ #category : #importing }
FamixF77ImportingContext >> importTypeUnknown [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #TypeUnknown)
]

{ #category : #importing }
FamixF77ImportingContext >> importUnknownSourceLanguage [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #UnknownSourceLanguage)
]

{ #category : #importing }
FamixF77ImportingContext >> importVariable [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Variable)
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportAccess [

	<generated>
	^ self shouldImport: #Access
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportComment [

	<generated>
	^ self shouldImport: #Comment
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportExternalDeclaration [

	<generated>
	^ self shouldImport: #ExternalDeclaration
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportInclude [

	<generated>
	^ self shouldImport: #Include
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportIncludedFile [

	<generated>
	^ self shouldImport: #IncludedFile
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportIndexedFileAnchor [

	<generated>
	^ self shouldImport: #IndexedFileAnchor
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportInvocation [

	<generated>
	^ self shouldImport: #Invocation
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportPUBlockdata [

	<generated>
	^ self shouldImport: #PUBlockdata
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportPUComment [

	<generated>
	^ self shouldImport: #PUComment
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportPUFunction [

	<generated>
	^ self shouldImport: #PUFunction
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportPUMain [

	<generated>
	^ self shouldImport: #PUMain
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportPUProcedure [

	<generated>
	^ self shouldImport: #PUProcedure
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportPUSubroutine [

	<generated>
	^ self shouldImport: #PUSubroutine
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportParameter [

	<generated>
	^ self shouldImport: #Parameter
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportProgramFile [

	<generated>
	^ self shouldImport: #ProgramFile
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportSourceLanguage [

	<generated>
	^ self shouldImport: #SourceLanguage
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportSourceTextAnchor [

	<generated>
	^ self shouldImport: #SourceTextAnchor
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportType [

	<generated>
	^ self shouldImport: #Type
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportTypeIntrinsic [

	<generated>
	^ self shouldImport: #TypeIntrinsic
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportTypeUnknown [

	<generated>
	^ self shouldImport: #TypeUnknown
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportUnknownSourceLanguage [

	<generated>
	^ self shouldImport: #UnknownSourceLanguage
]

{ #category : #testing }
FamixF77ImportingContext >> shouldImportVariable [

	<generated>
	^ self shouldImport: #Variable
]
