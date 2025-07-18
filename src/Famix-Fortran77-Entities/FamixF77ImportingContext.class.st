"
This class is used to choose the entities to be imported when loading a model from file.
It is used by `MiImportingContextPresenter` in a `MiImportModelFromFileDialog` to import a FamixF77Model.
"
Class {
	#name : 'FamixF77ImportingContext',
	#superclass : 'FamixImportingContext',
	#category : 'Famix-Fortran77-Entities-Import',
	#package : 'Famix-Fortran77-Entities',
	#tag : 'Import'
}

{ #category : 'accessing' }
FamixF77ImportingContext class >> importedMetamodel [

	<generated>
	^ FamixF77Model metamodel
]

{ #category : 'importing' }
FamixF77ImportingContext >> importAccess [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Access)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importComment [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Comment)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importCommonGroup [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #CommonGroup)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importEntityTyping [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #EntityTyping)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importExternalDeclaration [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ExternalDeclaration)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importImplicit [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Implicit)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importInclude [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Include)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importIncludedFile [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #IncludedFile)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importIndexedFileAnchor [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #IndexedFileAnchor)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importIntrinsicRoutine [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #IntrinsicRoutine)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importInvocation [

	<generated>
	^ self importAssociation: (self class fm3ClassNamed: #Invocation)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importPUBlockdata [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PUBlockdata)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importPUFunction [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PUFunction)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importPUMain [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PUMain)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importPUProcedure [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PUProcedure)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importPUSubroutine [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #PUSubroutine)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importParameter [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Parameter)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importProgramFile [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #ProgramFile)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importSourceLanguage [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceLanguage)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importSourceTextAnchor [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #SourceTextAnchor)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importStatementFunction [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #StatementFunction)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importStructuralEntity [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #StructuralEntity)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importType [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Type)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importTypeIntrinsic [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #TypeIntrinsic)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importTypeUnknown [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #TypeUnknown)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importUnknownVariable [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #UnknownVariable)
]

{ #category : 'importing' }
FamixF77ImportingContext >> importVariable [

	<generated>
	^ self importConcreteEntity: (self class fm3ClassNamed: #Variable)
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportAccess [

	<generated>
	^ self shouldImport: #Access
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportComment [

	<generated>
	^ self shouldImport: #Comment
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportCommonGroup [

	<generated>
	^ self shouldImport: #CommonGroup
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportEntityTyping [

	<generated>
	^ self shouldImport: #EntityTyping
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportExternalDeclaration [

	<generated>
	^ self shouldImport: #ExternalDeclaration
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportImplicit [

	<generated>
	^ self shouldImport: #Implicit
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportInclude [

	<generated>
	^ self shouldImport: #Include
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportIncludedFile [

	<generated>
	^ self shouldImport: #IncludedFile
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportIndexedFileAnchor [

	<generated>
	^ self shouldImport: #IndexedFileAnchor
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportIntrinsicRoutine [

	<generated>
	^ self shouldImport: #IntrinsicRoutine
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportInvocation [

	<generated>
	^ self shouldImport: #Invocation
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportPUBlockdata [

	<generated>
	^ self shouldImport: #PUBlockdata
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportPUFunction [

	<generated>
	^ self shouldImport: #PUFunction
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportPUMain [

	<generated>
	^ self shouldImport: #PUMain
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportPUProcedure [

	<generated>
	^ self shouldImport: #PUProcedure
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportPUSubroutine [

	<generated>
	^ self shouldImport: #PUSubroutine
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportParameter [

	<generated>
	^ self shouldImport: #Parameter
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportProgramFile [

	<generated>
	^ self shouldImport: #ProgramFile
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportSourceLanguage [

	<generated>
	^ self shouldImport: #SourceLanguage
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportSourceTextAnchor [

	<generated>
	^ self shouldImport: #SourceTextAnchor
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportStatementFunction [

	<generated>
	^ self shouldImport: #StatementFunction
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportStructuralEntity [

	<generated>
	^ self shouldImport: #StructuralEntity
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportType [

	<generated>
	^ self shouldImport: #Type
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportTypeIntrinsic [

	<generated>
	^ self shouldImport: #TypeIntrinsic
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportTypeUnknown [

	<generated>
	^ self shouldImport: #TypeUnknown
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportUnknownVariable [

	<generated>
	^ self shouldImport: #UnknownVariable
]

{ #category : 'testing' }
FamixF77ImportingContext >> shouldImportVariable [

	<generated>
	^ self shouldImport: #Variable
]
